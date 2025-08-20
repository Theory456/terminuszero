SMODS.Joker{ --Glyph of Probability
    key = "glyphofprobability",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Probability',
        ['text'] = {
            [1] = 'Played {C:attention}unenhanced{} cards have a',
            [2] = '{C:green}#1# in #2#{} chance of becoming',
            [3] = '{C:attention}Lucky Cards{} when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_teu_glyphofprobability') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not ((function()
        local enhancements = SMODS.get_enhancements(context.other_card)
        for k, v in pairs(enhancements) do
            if v then
                return true
            end
        end
        return false
    end)()) then
                if SMODS.pseudorandom_probability(card, 'group_0_2c1d0a16', 1, card.ability.extra.odds, 'j_teu_glyphofprobability') then
                      context.other_card:set_ability(G.P_CENTERS.m_lucky)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                  end
            end
        end
    end
}
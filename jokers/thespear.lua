SMODS.Joker{ --The Spear
    key = "thespear",
    config = {
        extra = {
            currentante = 0,
            odds = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Spear',
        ['text'] = {
            [1] = 'Scored {C:enhanced}Aegean Cards{} have',
            [2] = 'a {C:green}#2# in #3#{} chance of',
            [3] = 'giving {X:red,C:white}X#1#{} Mult, chance',
            [4] = 'and effect scales by {C:attention}Ante{} level'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
        x = 5,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_thespear') 
        return {vars = {(G.GAME.round_resets.ante or 0), new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true and G.GAME.round_resets.ante >= 1) then
                if SMODS.pseudorandom_probability(card, 'group_0_3faf543c', 1, card.ability.extra.odds, 'j_terminus_thespear') then
                      SMODS.calculate_effect({Xmult = G.GAME.round_resets.ante}, card)
                  end
            end
        end
    end
}
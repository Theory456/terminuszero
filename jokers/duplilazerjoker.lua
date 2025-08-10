SMODS.Joker{ --Duplilazer Joker
    key = "duplilazerjoker",
    config = {
        extra = {
            jscale = 1,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Duplilazer Joker',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance to {C:attention}octuple{} {C:blue}+Chips{}',
            [2] = 'at the end of the shop',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1#{}{C:inactive} Chips){}'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_duplilazerjoker') 
        return {vars = {card.ability.extra.jscale, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_5f3b949b', 1, card.ability.extra.odds, 'j_terminus_duplilazerjoker') then
                      SMODS.calculate_effect({func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) * 8
                    return true
                end}, card)
                  end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.jscale
                }
        end
    end
}
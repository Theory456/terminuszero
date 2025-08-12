SMODS.Joker{ --Dupligrow Joker
    key = "dupligrowjoker",
    config = {
        extra = {
            jscale = 1,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Dupligrow Joker',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance to {C:attention}double{}',
            [2] = '{C:blue}+Chips{} per hand played',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 2,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_dupligrowjoker') 
        return {vars = {card.ability.extra.jscale, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    chips = card.ability.extra.jscale
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_a9f8b329', 1, card.ability.extra.odds, 'j_terminus_dupligrowjoker') then
                      card.ability.extra.jscale = (card.ability.extra.jscale) * 2
                        
                  end
                        return true
                    end
                }
            end
        end
    end
}
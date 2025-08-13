SMODS.Joker{ --Duplicator Joker
    key = "duplicatorjoker",
    config = {
        extra = {
            jscale = 1
        }
    },
    loc_txt = {
        ['name'] = 'Duplicator Joker',
        ['text'] = {
            [1] = 'Double {C:blue}+Chips{} at the',
            [2] = 'end of every {C:money}shop{}',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 2,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jscale}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
                return {
                    func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) * 2
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.jscale
                }
        end
    end
}
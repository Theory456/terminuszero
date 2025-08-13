SMODS.Joker{ --Swifty Joker
    key = "swiftyjoker",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'Swifty Joker',
        ['text'] = {
            [1] = 'Scored cards give {C:red}+1{} Mult',
            [2] = 'per card scored in the hand',
            [3] = '{C:inactive}(Currently:{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jscale}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.jscale = (card.ability.extra.jscale) + 1
                return {
                    mult = card.ability.extra.jscale
                }
        end
        if context.after and context.cardarea == G.jokers  then
                return {
                    func = function()
                    card.ability.extra.jscale = 0
                    return true
                end
                }
        end
    end
}
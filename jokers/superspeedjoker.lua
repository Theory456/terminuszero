SMODS.Joker{ --Superspeed Joker
    key = "superspeedjoker",
    config = {
        extra = {
            jscale = 1
        }
    },
    loc_txt = {
        ['name'] = 'Superspeed Joker',
        ['text'] = {
            [1] = 'Scored cards give {X:red,C:white}X0.01{} Mult',
            [2] = 'per card scored',
            [3] = '{C:inactive}(Currently:{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    cost = 10,
    rarity = 3,
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
                card.ability.extra.jscale = (card.ability.extra.jscale) + 0.01
                return {
                    x_chips = card.ability.extra.jscale
                }
        end
    end
}
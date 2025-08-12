SMODS.Joker{ --Converter
    key = "converter",
    config = {
        extra = {
            xchips = 0.5,
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Converter',
        ['text'] = {
            [1] = '{X:blue,C:white}X0.5{} Chips, but {X:red,C:white}X2{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
    end
}
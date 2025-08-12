SMODS.Joker{ --Converter 2
    key = "converter2",
    config = {
        extra = {
            xchips = 2,
            Xmult = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Converter 2',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult, but {X:blue,C:white}X2{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
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
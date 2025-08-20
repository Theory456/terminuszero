SMODS.Joker{ --Converter 2
    key = "converter2",
    config = {
        extra = {
            Xmult = 0.5,
            xchips = 2
        }
    },
    loc_txt = {
        ['name'] = 'Converter 2',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult, {X:blue,C:white}X2{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        x_chips = card.ability.extra.xchips,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}
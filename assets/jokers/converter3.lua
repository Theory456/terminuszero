SMODS.Joker{ --Converter 3
    key = "converter3",
    config = {
        extra = {
            mult = 33,
            xchips = 0.6
        }
    },
    loc_txt = {
        ['name'] = 'Converter 3',
        ['text'] = {
            [1] = '{X:blue,C:white}X0.6{} Chips, but {C:red}+33{} Mult'
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
                    mult = card.ability.extra.mult,
                    extra = {
                        x_chips = card.ability.extra.xchips,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}
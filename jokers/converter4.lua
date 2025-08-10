SMODS.Joker{ --Converter 4
    key = "converter4",
    config = {
        extra = {
            chips = 2000,
            Xmult = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Converter 4',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult, but {C:blue}+2,000{} Chips'
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
                    chips = card.ability.extra.chips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
    end
}
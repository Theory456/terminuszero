SMODS.Joker{ --Glyph of Viscosity
    key = "glyphofviscosity",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Viscosity',
        ['text'] = {
            [1] = '{C:red}+Mult{} equal to {X:attention,C:white}double{} the',
            [2] = 'current {C:attention}Ante{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    soul_pos = {
        x = 6,
        y = 4
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = (G.GAME.round_resets.ante) * 2
                }
        end
    end
}
SMODS.Joker{ --Glyph of Cyclicity
    key = "glyphofcyclicity",
    config = {
        extra = {
            mlt = 0,
            handsremaining = 0,
            discardsremaining = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Cyclicity',
        ['text'] = {
            [1] = '{C:red}+Mult{} equal to the amount',
            [2] = 'of {C:red}hands{} and {C:blue}discards{} remaining',
            [3] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
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
        x = 4,
        y = 3
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    mult = G.GAME.current_round.hands_left,
                    extra = {
                        mult = G.GAME.current_round.discards_left
                        }
                }
        end
    end
}
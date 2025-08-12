SMODS.Joker{ --Sticky Joker
    key = "stickyjoker",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sticky Joker',
        ['text'] = {
            [1] = '{X:red,C:white}XMult{} equal to the current Ante'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    cost = 8,
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
                    Xmult = G.GAME.round_resets.ante
                }
        end
    end
}
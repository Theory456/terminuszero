SMODS.Joker{ --Superstick Joker
    key = "superstickjoker",
    config = {
        extra = {
            leftmostcardrank = 0
        }
    },
    loc_txt = {
        ['name'] = 'Superstick Joker',
        ['text'] = {
            [1] = '{X:red,C:white}XMult{} equal to the rank of',
            [2] = 'the leftmost card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = (G.hand and G.hand.cards[1] and G.hand.cards[1].base.id or 0)
                }
        end
    end
}
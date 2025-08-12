SMODS.Joker{ --Everyone
    key = "everyone",
    config = {
        extra = {
            emult = 2.4
        }
    },
    loc_txt = {
        ['name'] = 'Everyone',
        ['text'] = {
            [1] = '{C:inactive}(Oh, don\'t let go of me...{}',
            [2] = '{C:inactive}At last, you\'re here with me...){}',
            [3] = '{X:enhanced,C:white}^2.4{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.emult
                }
        end
    end
}
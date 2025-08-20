SMODS.Joker{ --Third Harmonic
    key = "thirdharmonic",
    config = {
        extra = {
            Xmult = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Third Harmonic',
        ['text'] = {
            [1] = 'Scored 3s, 6s and 9s give',
            [2] = '{X:red,C:white}X1.2{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 6
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 3 or context.other_card:get_id() == 6 or context.other_card:get_id() == 9) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}
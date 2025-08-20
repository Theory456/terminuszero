SMODS.Joker{ --Fifth Harmonic
    key = "fifthharmonic",
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Fifth Harmonic',
        ['text'] = {
            [1] = 'Scored 5s and 10s give',
            [2] = '{X:red,C:white}X1.5{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 2
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 5 or context.other_card:get_id() == 10) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}
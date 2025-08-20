SMODS.Joker{ --Second Harmonic
    key = "secondharmonic",
    config = {
        extra = {
            Xmult = 2,
            Xmult2 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Second Harmonic',
        ['text'] = {
            [1] = 'Scored {C:attention}even{} cards give {X:red,C:white}X2{} Mult',
            [2] = 'Scored {C:attention}odd{} cards give {X:red,C:white}X0.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 5
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            end
        end
    end
}
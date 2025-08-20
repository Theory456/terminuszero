SMODS.Joker{ --Seventh Harmonic
    key = "seventhharmonic",
    config = {
        extra = {
            Xmult = 2.1,
            Xmult2 = 1.4
        }
    },
    loc_txt = {
        ['name'] = 'Seventh Harmonic',
        ['text'] = {
            [1] = '{C:attention}Gold{} 7s give {X:red,C:white}X2.1{} Mult when scored',
            [2] = 'Other 7s give {X:red,C:white}X1.4{} Mult  when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
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
        x = 9,
        y = 5
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 7 or SMODS.get_enhancements(context.other_card)["m_gold"] == true) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif (context.other_card:get_id() == 7 or not (SMODS.get_enhancements(context.other_card)["m_gold"] == true)) then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            end
        end
    end
}
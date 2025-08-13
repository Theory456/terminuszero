SMODS.Joker{ --Goner Captain
    key = "gonercaptain",
    config = {
        extra = {
            emult = 1.15,
            emult2 = 1.17,
            emult3 = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Goner Captain',
        ['text'] = {
            [1] = 'Played 5s. 7s and 10s give {X:enhanced,C:white}^1.1{} Mult',
            [2] = 'with an extra additive {X:enhanced,C:white}^0.01{} Mult',
            [3] = '{C:attention}per rank{} they have when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 5 then
                return {
                    e_mult = card.ability.extra.emult
                }
            elseif context.other_card:get_id() == 7 then
                return {
                    e_mult = card.ability.extra.emult2
                }
            elseif context.other_card:get_id() == 10 then
                return {
                    e_mult = card.ability.extra.emult3
                }
            end
        end
    end
}
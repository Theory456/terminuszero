SMODS.Joker{ --The Dyson Swarm
    key = "thedysonswarm",
    config = {
        extra = {
            Xmult = 2.2,
            Xmult2 = 2.3,
            Xmult3 = 2.4
        }
    },
    loc_txt = {
        ['name'] = 'The Dyson Swarm',
        ['text'] = {
            [1] = 'Scored 2s through 4s give {X:red,C:white}X2{} Mult',
            [2] = 'plus an extra {X:red,C:white}X0.1{} Mult',
            [3] = '{C:attention}per rank{} they have'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 4
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 2 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    Xmult = card.ability.extra.Xmult3
                }
            end
        end
    end
}
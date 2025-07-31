SMODS.Joker{ --The Janitor
    key = "thejanitor",
    config = {
        extra = {
            Xmult = 1.22,
            Xmult2 = 1.23,
            Xmult3 = 1.24,
            Xmult4 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'The Janitor',
        ['text'] = {
            [1] = 'Played 2s through 5s give {X:red,C:white}X1.2{} Mult',
            [2] = 'plus an extra {X:red,C:white}X0.01{} Mult',
            [3] = '{C:attention}per rank{} they have when scored'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 2,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
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
            elseif context.other_card:get_id() == 5 then
                return {
                    Xmult = card.ability.extra.Xmult4
                }
            end
        end
    end
}
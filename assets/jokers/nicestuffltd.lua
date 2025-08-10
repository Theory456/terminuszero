SMODS.Joker{ --Nice Stuff Ltd.
    key = "nicestuffltd",
    config = {
        extra = {
            Xmult = 1.36,
            Xmult2 = 1.37,
            Xmult3 = 1.38,
            Xmult4 = 1.39
        }
    },
    loc_txt = {
        ['name'] = 'Nice Stuff Ltd.',
        ['text'] = {
            [1] = 'Played 6s through 9s give {X:red,C:white}X1.3{} Mult',
            [2] = 'plus an extra {X:red,C:white}X0.01{} Mult',
            [3] = '{C:attention}per rank{} they have when scored'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    cost = 9,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif context.other_card:get_id() == 7 then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            elseif context.other_card:get_id() == 8 then
                return {
                    Xmult = card.ability.extra.Xmult3
                }
            elseif context.other_card:get_id() == 9 then
                return {
                    Xmult = card.ability.extra.Xmult4
                }
            end
        end
    end
}
SMODS.Joker{ --Royal Goods Inc.
    key = "royalgoodsinc",
    config = {
        extra = {
            Xmult = 1.4
        }
    },
    loc_txt = {
        ['name'] = 'Royal Goods Inc.',
        ['text'] = {
            [1] = 'Played 10s through Aces give {X:red,C:white}X1.4{} Mult'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 10 or (context.other_card:is_face() or context.other_card:get_id() == 14)) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}
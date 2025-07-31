SMODS.Joker{ --The Knight
    key = "theknight",
    config = {
        extra = {
            mult = 6,
            mult2 = 7,
            mult3 = 8,
            mult4 = 9
        }
    },
    loc_txt = {
        ['name'] = 'The Knight',
        ['text'] = {
            [1] = 'Played 6s through 9s give {C:red}+1{} Mult',
            [2] = '{C:attention}per rank{} they have when scored'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                return {
                    mult = card.ability.extra.mult
                }
            elseif context.other_card:get_id() == 7 then
                return {
                    mult = card.ability.extra.mult2
                }
            elseif context.other_card:get_id() == 8 then
                return {
                    mult = card.ability.extra.mult3
                }
            elseif context.other_card:get_id() == 9 then
                return {
                    mult = card.ability.extra.mult4
                }
            end
        end
    end
}
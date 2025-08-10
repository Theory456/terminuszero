SMODS.Joker{ --Kojer Manor
    key = "kojermanor",
    config = {
        extra = {
            scaling = 0,
            chips = 30,
            chips2 = 35,
            chips3 = 40,
            chips4 = 45
        }
    },
    loc_txt = {
        ['name'] = 'Kojer Manor',
        ['text'] = {
            [1] = 'Played 6s through 9s give {C:blue}+5{} Chips',
            [2] = '{C:attention}per rank{} they have when scored'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    cost = 3,
    rarity = 1,
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
                    chips = card.ability.extra.chips
                }
            elseif context.other_card:get_id() == 7 then
                return {
                    chips = card.ability.extra.chips2
                }
            elseif context.other_card:get_id() == 8 then
                return {
                    chips = card.ability.extra.chips3
                }
            elseif context.other_card:get_id() == 9 then
                return {
                    chips = card.ability.extra.chips4
                }
            end
        end
    end
}
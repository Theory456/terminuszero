SMODS.Joker{ --The Slave
    key = "theslave",
    config = {
        extra = {
            scaling = 0,
            chips = 10,
            chips2 = 15,
            chips3 = 20,
            chips4 = 25
        }
    },
    loc_txt = {
        ['name'] = 'The Slave',
        ['text'] = {
            [1] = 'Played 2s through 5s give {C:blue}+5{} Chips',
            [2] = '{C:attention}per rank{} they have when scored'
        }
    },
    pos = {
        x = 0,
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
            if context.other_card:get_id() == 2 then
                return {
                    chips = card.ability.extra.chips
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    chips = card.ability.extra.chips2
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    chips = card.ability.extra.chips3
                }
            elseif context.other_card:get_id() == 5 then
                return {
                    chips = card.ability.extra.chips4
                }
            end
        end
    end
}
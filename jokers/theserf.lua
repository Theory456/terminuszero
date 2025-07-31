SMODS.Joker{ --The Serf
    key = "theserf",
    config = {
        extra = {
            mult = 2,
            mult2 = 3,
            mult3 = 4,
            mult4 = 5
        }
    },
    loc_txt = {
        ['name'] = 'The Serf',
        ['text'] = {
            [1] = 'Played 2s through 5s give {C:red}+1{} Mult',
            [2] = '{C:attention}per rank{} they have when scored'
        }
    },
    pos = {
        x = 1,
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
                    mult = card.ability.extra.mult
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    mult = card.ability.extra.mult2
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    mult = card.ability.extra.mult3
                }
            elseif context.other_card:get_id() == 5 then
                return {
                    mult = card.ability.extra.mult4
                }
            end
        end
    end
}
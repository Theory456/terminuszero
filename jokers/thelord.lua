SMODS.Joker{ --The Lord
    key = "thelord",
    config = {
        extra = {
            scaling = 0,
            chips = 50
        }
    },
    loc_txt = {
        ['name'] = 'The Lord',
        ['text'] = {
            [1] = 'Played 10s through Aces give {C:blue}+50{} Chips',
            [2] = ''
        }
    },
    pos = {
        x = 1,
        y = 1
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
            if (context.other_card:get_id() == 10 or context.other_card:is_face() or context.other_card:get_id() == 14) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
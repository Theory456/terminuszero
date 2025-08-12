SMODS.Joker{ --Staff Joker
    key = "staffjoker",
    config = {
        extra = {
            scaling = 0,
            xchips = 4.6
        }
    },
    loc_txt = {
        ['name'] = 'Staff Joker',
        ['text'] = {
            [1] = 'Holding 46 base Chips in hand',
            [2] = 'gives {X:blue,C:white}X4.6{} Chips to played hand'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local chips_sum = 0
    for _, playing_card in pairs(G.hand.cards or {}) do
        chips_sum = chips_sum + playing_card.base.nominal
    end
    return chips_sum == 46
end)() then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}
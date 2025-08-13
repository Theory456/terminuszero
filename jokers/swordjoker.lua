SMODS.Joker{ --Sword Joker
    key = "swordjoker",
    config = {
        extra = {
            chips = 25,
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Sword Joker',
        ['text'] = {
            [1] = 'Playing exactly 50 base',
            [2] = 'chips in one hand gives',
            [3] = '{C:red}+5{} Mult and {C:blue}+25{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    cost = 5,
    rarity = 1,
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
    for _, playing_card in pairs(context.scoring_hand or {}) do
        chips_sum = chips_sum + playing_card.base.nominal
    end
    return chips_sum == 50
end)() then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
            end
        end
    end
}
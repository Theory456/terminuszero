SMODS.Joker{ --atlas_jelly_jokers[3]
    key = "atlasjellyjokers3",
    config = {
        extra = {
            chips = 333
        }
    },
    loc_txt = {
        ['name'] = 'atlas_jelly_jokers[3]',
        ['text'] = {
            [1] = '{C:blue}+333{} Chips if played hand contains',
            [2] = 'a {C:attention}Three of a Kind{} of exactly {C:attention}3{}',
            [3] = '{C:enhanced}Enhanced{} cards and nothing else'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
            if (next(context.poker_hands["Three of a Kind"]) and #context.scoring_hand == 3 and (function()
    local count = 0
    for _, playing_card in pairs(context.scoring_hand or {}) do
        if next(SMODS.get_enhancements(playing_card)) then
            count = count + 1
        end
    end
    return count == 3
end)()) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
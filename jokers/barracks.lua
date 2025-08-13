SMODS.Joker{ --Barracks
    key = "barracks",
    config = {
        extra = {
            discards = 1,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Barracks',
        ['text'] = {
            [1] = 'Discarding cards of all four vanilla',
            [2] = 'suits will not cost {C:attention}discards{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.pre_discard  then
            if ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Spades") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Hearts") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Diamonds") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)()) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                return true
            end
                }
            end
        end
    end
}
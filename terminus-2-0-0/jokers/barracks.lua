SMODS.Joker{ --Barracks
    key = "barracks",
    config = {
        extra = {
            discards = 2,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Barracks',
        ['text'] = {
            [1] = 'Discarding {C:hearts}Hearts{}, {C:spades}Spades{}, {C:diamonds}Diamonds{}',
            [2] = 'and {C:clubs}Clubs{} in a single hand gives',
            [3] = 'back rather than takes a {C:red}discard{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        if c:is_suit("Hearts") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)() and (function()
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
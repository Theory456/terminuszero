SMODS.Joker{ --The Slanted Corundrum
    key = "theslantedcorundrum",
    config = {
        extra = {
            discards = 1,
            hands = 1,
            permanent = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Slanted Corundrum',
        ['text'] = {
            [1] = 'Scoring a Flush of {C:diamonds}Diamonds{}',
            [2] = 'adds a permanent {C:red}discard{}',
            [3] = 'Discarding at least 5 {C:diamonds}Diamonds{}',
            [4] = 'adds a permanent {C:blue}hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 6
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "Flush" and (function()
    local allMatchSuit = true
    for i, c in ipairs(context.scoring_hand) do
        if not (c:is_suit("Diamonds")) then
            allMatchSuit = false
            break
        end
    end
    
    return allMatchSuit and #context.scoring_hand > 0
end)()) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        ease_discard(card.ability.extra.discards)
        
                return true
            end
                }
            end
        end
        if context.pre_discard  then
            if ((function()
    local allMatchSuit = true
    for i, c in ipairs(context.full_hand) do
        if not (c:is_suit("Diamonds")) then
            allMatchSuit = false
            break
        end
    end
    
    return allMatchSuit and #context.full_hand > 0
end)() and #context.full_hand >= 5) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hands).." Hand", colour = G.C.GREEN})
                
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
        
                return true
            end
                }
            end
        end
    end
}
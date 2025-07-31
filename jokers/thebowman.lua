SMODS.Joker{ --The Bowman
    key = "thebowman",
    config = {
        extra = {
            hands = 2,
            discards = 2,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Bowman',
        ['text'] = {
            [1] = 'If the first hand played is a single 9,',
            [2] = 'gain back {C:blue}2{} hands and {C:red}2{} discards{}'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (#context.scoring_hand == 1 and (function()
    local allMatchRank = true
    for i, c in ipairs(context.full_hand) do
        if not (c:get_id() == 9) then
            allMatchRank = false
            break
        end
    end
    
    return allMatchRank and #context.full_hand > 0
end)()) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hands).." Hand", colour = G.C.GREEN})
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                return true
            end,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                return true
            end,
                        colour = G.C.ORANGE
                        }
                }
            end
        end
    end
}
SMODS.Joker{ --Bow Tower
    key = "bowtower",
    config = {
        extra = {
            hands = 1,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bow Tower',
        ['text'] = {
            [1] = '{C:attention}Two Pairs{} won\'t cost {C:attention}hands{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Two Pair" then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hands).." Hand", colour = G.C.GREEN})
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                return true
            end
                }
            end
        end
    end
}
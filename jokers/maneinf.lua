SMODS.Joker{ --Maneinf
    key = "maneinf",
    config = {
        extra = {
            Xmult = 1000000
        }
    },
    loc_txt = {
        ['name'] = 'Maneinf',
        ['text'] = {
            [1] = 'Hand size set to {C:blue}2{}',
            [2] = 'Scored {C:attention}Pairs{} give {X:red,C:white}X1e6{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Pair" then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_hand_size = G.hand.config.card_limit
        local difference = 2 - G.hand.config.card_limit
        G.hand:change_size(difference)
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_hand_size then
            local difference = card.ability.extra.original_hand_size - G.hand.config.card_limit
            G.hand:change_size(difference)
        end
    end
}
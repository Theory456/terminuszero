SMODS.Joker{ --The Origin
    key = "theorigin",
    config = {
        extra = {
            hand_change = 1,
            discard_change = 0,
            Xmult = 10
        }
    },
    loc_txt = {
        ['name'] = 'The Origin',
        ['text'] = {
            [1] = 'Set {C:blue}hands{} to {C:attention}1{}',
            [2] = 'Set {C:red}discards{} to {C:red}0{}',
            [3] = '{C:enhanced}Aegean Cards{} give {X:red,C:white}X10{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 3
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_hands = G.GAME.round_resets.hands
        G.GAME.round_resets.hands = card.ability.extra.hand_change
        card.ability.extra.original_discards = G.GAME.round_resets.discards
        G.GAME.round_resets.discards = card.ability.extra.discard_change
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_hands then
            G.GAME.round_resets.hands = card.ability.extra.original_hands
        end
        if card.ability.extra.original_discards then
            G.GAME.round_resets.discards = card.ability.extra.original_discards
        end
    end
}
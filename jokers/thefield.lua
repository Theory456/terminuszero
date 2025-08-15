SMODS.Joker{ --The Field
    key = "thefield",
    config = {
        extra = {
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'The Field',
        ['text'] = {
            [1] = '{C:enhanced}Aegean Cards{} give {X:red,C:white}X2{} Mult',
            [2] = 'when scored in a hand that',
            [3] = 'contains a {C:attention}Four of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
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
        y = 1
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (next(context.poker_hands["Four of a Kind"]) and SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}
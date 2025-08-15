SMODS.Joker{ --The Duality
    key = "theduality",
    config = {
        extra = {
            Xmult = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'The Duality',
        ['text'] = {
            [1] = '{C:enhanced}Aegean Cards{} give {X:red,C:white}X1.2{} Mult',
            [2] = 'when scored in a hand that',
            [3] = 'contains a {C:attention}Pair{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
        y = 1
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (next(context.poker_hands["Pair"]) and SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}
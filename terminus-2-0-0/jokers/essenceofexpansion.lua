SMODS.Joker{ --Essence of Expansion
    key = "essenceofexpansion",
    config = {
        extra = {
            handsplayedthisround = 0,
            discardsusedthisround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Essence of Expansion',
        ['text'] = {
            [1] = 'Retrigger the {C:attention}last{} played card',
            [2] = 'for every {C:blue}hand{} and {C:red}discard{}',
            [3] = 'used during the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 1
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                return {
                    repetitions = G.GAME.current_round.hands_played,
                    message = localize('k_again_ex'),
                    extra = {
                        repetitions = G.GAME.current_round.discards_used,
                            message = localize('k_again_ex'),
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}
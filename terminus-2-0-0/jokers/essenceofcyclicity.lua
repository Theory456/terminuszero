SMODS.Joker{ --Essence of Cyclicity
    key = "essenceofcyclicity",
    config = {
        extra = {
            handsremaining = 0,
            discardsremaining = 0
        }
    },
    loc_txt = {
        ['name'] = 'Essence of Cyclicity',
        ['text'] = {
            [1] = 'Retrigger the {C:attention}first{} played card',
            [2] = 'for every {C:blue}hand{} and {C:red}discard{}',
            [3] = 'left in the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        x = 4,
        y = 1
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = G.GAME.current_round.hands_left,
                    message = localize('k_again_ex'),
                    extra = {
                        repetitions = G.GAME.current_round.discards_left,
                            message = localize('k_again_ex'),
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}
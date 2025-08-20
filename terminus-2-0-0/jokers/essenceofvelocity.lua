SMODS.Joker{ --Essence of Velocity
    key = "essenceofvelocity",
    config = {
        extra = {
            reps = 0
        }
    },
    loc_txt = {
        ['name'] = 'Essence of Velocity',
        ['text'] = {
            [1] = 'Retrigger the {C:attention}last{} played card',
            [2] = 'for every scored card in the',
            [3] = 'played {C:attention}poker hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
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
        y = 2
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                return {
                    repetitions = card.ability.extra.reps,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                card.ability.extra.reps = (card.ability.extra.reps) + 1
            elseif not (context.other_card == context.scoring_hand[#context.scoring_hand]) then
                card.ability.extra.reps = (card.ability.extra.reps) + 1
            end
        end
        if context.after and context.cardarea == G.jokers  then
                return {
                    func = function()
                    card.ability.extra.reps = 0
                    return true
                end
                }
        end
    end
}
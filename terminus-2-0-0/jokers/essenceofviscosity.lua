SMODS.Joker{ --Essence of Viscosity
    key = "essenceofviscosity",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Essence of Viscosity',
        ['text'] = {
            [1] = 'Retrigger the {C:attention}last{} played card',
            [2] = 'with repetitions equal to the',
            [3] = 'current {C:attention}Ante level{}',
            [4] = '{C:inactive}(Will not work on non-positive Antes){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        x = 6,
        y = 2
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[#context.scoring_hand] and G.GAME.round_resets.ante >= 1) then
                return {
                    repetitions = G.GAME.round_resets.ante,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}
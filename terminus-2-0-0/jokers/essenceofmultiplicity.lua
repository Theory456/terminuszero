SMODS.Joker{ --Essence of Multiplicity
    key = "essenceofmultiplicity",
    config = {
        extra = {
            reps = 2,
            req = 2,
            left = 0
        }
    },
    loc_txt = {
        ['name'] = 'Essence of Multiplicity',
        ['text'] = {
            [1] = 'The {C:attention}first{} played card retriggers',
            [2] = '{C:attention}2{} times, {X:attention,C:white}double{} the previous value after',
            [3] = '{C:attention}2{} {C:inactive}(2){} Blinds skipped, requirements {X:attention,C:white}double{}',
            [4] = 'after triggering'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        x = 8,
        y = 1
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = card.ability.extra.reps,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.skip_blind  then
            if (card.ability.extra.left or 0) == 1 then
                return {
                    func = function()
                    card.ability.extra.reps = (card.ability.extra.reps) * 2
                    return true
                end,
                    message = "Upgrade!",
                    extra = {
                        func = function()
                    card.ability.extra.req = (card.ability.extra.req) * 2
                    return true
                end,
                        colour = G.C.MULT,
                        extra = {
                            func = function()
                    card.ability.extra.left = card.ability.extra.req
                    return true
                end,
                            colour = G.C.BLUE
                        }
                        }
                }
            elseif (card.ability.extra.left or 0) ~= 1 then
                return {
                    func = function()
                    card.ability.extra.left = math.max(0, (card.ability.extra.left) - 1)
                    return true
                end
                }
            end
        end
    end
}
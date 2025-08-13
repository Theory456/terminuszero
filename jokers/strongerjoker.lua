SMODS.Joker{ --Stronger Joker
    key = "strongerjoker",
    config = {
        extra = {
            jscale = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stronger Joker',
        ['text'] = {
            [1] = '{C:red}+1{} Mult, scales by {X:attention,C:white}X1.62{}',
            [2] = 'when {C:attention}Blind{} is skipped'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    cost = 8,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.jscale
                }
        end
        if context.skip_blind  then
                return {
                    func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) * 1.62
                    return true
                end
                }
        end
    end
}
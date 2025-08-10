SMODS.Joker{ --Overpowered Joker
    key = "overpoweredjoker",
    config = {
        extra = {
            jscale = 1
        }
    },
    loc_txt = {
        ['name'] = 'Overpowered Joker',
        ['text'] = {
            [1] = '{X:red,C:white}X1{} Mult, scales by {X:attention,C:white}X1.62{}',
            [2] = 'when {C:attention}Blind{} is skipped'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    cost = 16,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.jscale
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
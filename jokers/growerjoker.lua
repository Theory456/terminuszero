SMODS.Joker{ --Grower Joker
    key = "growerjoker",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'Grower Joker',
        ['text'] = {
            [1] = 'Scored cards give {C:blue}+10{} Chips',
            [2] = 'per {C:attention}Blind{} selected',
            [3] = '{C:inactive}(Currently:{} {C:blue}+#1# {} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jscale}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    chips = card.ability.extra.jscale
                }
        end
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) + 10
                    return true
                end
                }
        end
    end
}
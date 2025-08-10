SMODS.Joker{ --Speedy Joker
    key = "speedyjoker",
    config = {
        extra = {
            jscale = 0,
            jscale2 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Speedy Joker',
        ['text'] = {
            [1] = 'Scored cards give {C:red}+0.1{} Mult',
            [2] = 'per card scored',
            [3] = '{C:inactive}(Currently:{} {C:red}+#1#{} {C:inactive} Mult){}'
        }
    },
    pos = {
        x = 6,
        y = 3
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
                card.ability.extra.jscale = (card.ability.extra.jscale) + card.ability.extra.jscale2
                return {
                    mult = card.ability.extra.jscale
                }
        end
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.jscale2 = (card.ability.extra.jscale2) + 0.01
                    return true
                end
                }
        end
    end
}
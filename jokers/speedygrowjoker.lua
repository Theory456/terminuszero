SMODS.Joker{ --Speedygrow Joker
    key = "speedygrowjoker",
    config = {
        extra = {
            jscale = 0,
            jscale2 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Speedygrow Joker',
        ['text'] = {
            [1] = 'Scored cards give {C:red}+#2#{} Mult',
            [2] = 'per card scored, which itself scores',
            [3] = 'by {C:red}+0.01{} when hand is played',
            [4] = '{C:inactive}(Currently:{} {C:red}+#1#{} {C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jscale, card.ability.extra.jscale2}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.jscale = (card.ability.extra.jscale) + card.ability.extra.jscale2
                return {
                    mult = card.ability.extra.jscale
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                card.ability.extra.jscale2 = (card.ability.extra.jscale2) + 0.01
        end
    end
}
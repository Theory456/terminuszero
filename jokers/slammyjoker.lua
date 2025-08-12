SMODS.Joker{ --Slammy Joker
    key = "slammyjoker",
    config = {
        extra = {
            jscale = 2
        }
    },
    loc_txt = {
        ['name'] = 'Slammy Joker',
        ['text'] = {
            [1] = '{C:red}+1{} Mult per hand played',
            [2] = '{C:inactive}(Currently: {}{C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
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
        if context.cardarea == G.jokers and context.joker_main  then
                local jscale_value = card.ability.extra.jscale
                card.ability.extra.jscale = (card.ability.extra.jscale) + 1
                return {
                    mult = jscale_value
                }
        end
    end
}
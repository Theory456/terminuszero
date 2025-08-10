SMODS.Joker{ --Duplispeed Joker
    key = "duplispeedjoker",
    config = {
        extra = {
            jscale = 1
        }
    },
    loc_txt = {
        ['name'] = 'Duplispeed Joker',
        ['text'] = {
            [1] = 'Scored cards give a {C:green}#2# in #3#{}',
            [2] = 'chance to {C:attention}double{} {C:blue}+Chips{}',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1#{}{C:inactive} Chips){}'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 2,
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
                return {
                    chips = card.ability.extra.jscale
                }
        end
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.jscale = (card.ability.extra.jscale) * 2
        end
    end
}
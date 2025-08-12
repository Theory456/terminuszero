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
            [2] = 'chance to give {X:attention,C:white}X1.1{} to {C:blue}+Chips{}',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    cost = 2,
    rarity = 3,
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
                card.ability.extra.jscale = (card.ability.extra.jscale) * 1.1
        end
    end
}
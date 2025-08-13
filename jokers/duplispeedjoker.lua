SMODS.Joker{ --Duplispeed Joker
    key = "duplispeedjoker",
    config = {
        extra = {
            jscale = 1,
            odds = 2
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
        x = 4,
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_duplispeedjoker') 
        return {vars = {card.ability.extra.jscale, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.jscale
                }
        end
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_48a49846', 1, card.ability.extra.odds, 'j_terminus_duplispeedjoker') then
                      card.ability.extra.jscale = (card.ability.extra.jscale) * 1.1
                        
                  end
            end
        end
    end
}
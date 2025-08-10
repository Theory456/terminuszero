SMODS.Joker{ --Quadruplicator Joker
    key = "quadruplicatorjoker",
    config = {
        extra = {
            jscale = 1,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Quadruplicator Joker',
        ['text'] = {
            [1] = '{X:blue,C:white}X1{} Chips, {C:green}#2# in #3#{} chance for',
            [2] = '{X:attention,C:white}X4{} at the end of every shop',
            [3] = '{C:inactive}(Currently: {} {X:blue,C:white}X#1#{}{C:inactive} Chips){}'
        }
    },
    pos = {
        x = 9,
        y = 2
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_quadruplicatorjoker') 
        return {vars = {card.ability.extra.jscale, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_5f3b949b', 1, card.ability.extra.odds, 'j_terminus_quadruplicatorjoker') then
                      SMODS.calculate_effect({func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) * 3
                    return true
                end}, card)
                  end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.jscale
                }
        end
    end
}
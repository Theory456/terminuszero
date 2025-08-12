SMODS.Joker{ --Lazer Joker
    key = "lazerjoker",
    config = {
        extra = {
            odds = 2,
            mult = 12
        }
    },
    loc_txt = {
        ['name'] = 'Lazer Joker',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for {C:red}+12{} Mult',
            [2] = '{C:inactive}(Yes, this is really lazey.){}'
        },
        ['unlock'] = {
            [1] = ''
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_lazerjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2aefa37c', 1, card.ability.extra.odds, 'j_terminus_lazerjoker') then
                      SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                  end
            end
        end
    end
}
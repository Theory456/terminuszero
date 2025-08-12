SMODS.Joker{ --Barricades
    key = "barricades",
    config = {
        extra = {
            odds = 4,
            mult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Barricades',
        ['text'] = {
            [1] = 'Scored cards have a {C:green}#1# in #2#{}',
            [2] = 'chance to give {C:red}+4{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 0
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_barricades') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4c74d3b5', 1, card.ability.extra.odds, 'j_terminus_barricades') then
                      SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                  end
            end
        end
    end
}
SMODS.Joker{ --Knight
    key = "knight",
    config = {
        extra = {
            odds = 10,
            mult = 80
        }
    },
    loc_txt = {
        ['name'] = 'Knight',
        ['text'] = {
            [1] = 'Played cards of {C:spades}Spades{} or {C:clubs}Clubs{}',
            [2] = 'suit have a {C:green}#1# in #2#{} chance of',
            [3] = 'giving {C:red}+80{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_teu_knight') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                if SMODS.pseudorandom_probability(card, 'group_0_a32fe36c', 1, card.ability.extra.odds, 'j_teu_knight') then
                      SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                  end
            end
        end
    end
}
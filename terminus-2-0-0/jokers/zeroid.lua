SMODS.Joker{ --Zeroid
    key = "zeroid",
    config = {
        extra = {
            set_probability = 0,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Zeroid',
        ['text'] = {
            [1] = 'All {C:attention}listed{} {C:green}probabilities{} become {C:red}0{}',
            [2] = '{C:inactive}(ex: {}{C:green}1 in 3{}{C:inactive} -> {}{C:green}0 in 3{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 7
    },

    calculate = function(self, card, context)
        if context.fix_probability  then
        local numerator, denominator = context.numerator, context.denominator
                numerator = card.ability.extra.set_probability
      return {
        numerator = numerator, 
        denominator = denominator
      }
        end
    end
}
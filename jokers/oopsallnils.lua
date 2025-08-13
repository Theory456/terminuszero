SMODS.Joker{ --Oops! All nils
    key = "oopsallnils",
    config = {
        extra = {
            mod_probability = 0,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oops! All nils',
        ['text'] = {
            [1] = 'All {C:attention}listed{} and mutable',
            [2] = '{C:uncommon}probabilities{} become {C:red}zero{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
          if context.mod_probability  then
          local numerator, denominator = context.numerator, context.denominator
                  numerator = numerator * card.ability.extra.mod_probability
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
    end
}
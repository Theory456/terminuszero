SMODS.Joker{ --Oops! One Cube
    key = "oopsonecube",
    config = {
        extra = {
            mod_probability = 1,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oops! One Cube',
        ['text'] = {
            [1] = 'Increase the {C:attention}numerator{} of all {C:attention}listed{}',
            [2] = '{C:green}probabilities{} by {C:attention}1{}',
            [3] = '(ex:{C:green} 1 in 2{} -> {C:green}2 in 2{}, {C:green}4 in 7{} -> {C:green}5 in 7{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
          if context.mod_probability  then
          local numerator, denominator = context.numerator, context.denominator
                  numerator = numerator + card.ability.extra.mod_probability
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
    end
}
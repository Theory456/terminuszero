SMODS.Joker{ --s6 llA !spoO
    key = "s6llaspoo",
    config = {
        extra = {
            mod_probability = 2,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 's6 llA !spoO',
        ['text'] = {
            [1] = 'Doubles all {C:attention}listed{} {C:green}probabilities{}',
            [2] = '(ex: {C:green}1 in 3{} -> {C:green}1 in 1.5{})'
        }
    },
    pos = {
        x = 2,
        y = 3
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
                  denominator = denominator / card.ability.extra.mod_probability
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
    end
}
SMODS.Joker{ --Essence of Probability
    key = "essenceofprobability",
    config = {
        extra = {
            odds = 2,
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Essence of Probability',
        ['text'] = {
            [1] = 'Played cards have a {C:green}#1# in #2#{} chance',
            [2] = 'of retriggering when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 2
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_teu_essenceofprobability') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
                if SMODS.pseudorandom_probability(card, 'group_0_ac69f337', 1, card.ability.extra.odds, 'j_teu_essenceofprobability') then
                      return {repetitions = card.ability.extra.repetitions}
                        
                  end
        end
    end
}
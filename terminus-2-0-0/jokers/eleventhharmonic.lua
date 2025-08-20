SMODS.Joker{ --Eleventh Harmonic
    key = "eleventhharmonic",
    config = {
        extra = {
            odds = 11,
            Xmult = 11,
            Xmult2 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Eleventh Harmonic',
        ['text'] = {
            [1] = '{X:red,C:white}X0.1{} Mult',
            [2] = 'Played 11s give {X:red,C:white}X11{} Mult when scored',
            [3] = 'Other cards have a {C:uncommon}#1# in #2#{} chance',
            [4] = 'of also giving {X:red,C:white}X11{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_teu_eleventhharmonic') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fbb0eb61', 1, card.ability.extra.odds, 'j_teu_eleventhharmonic') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
        end
    end
}
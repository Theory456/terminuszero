SMODS.Joker{ --GMC-OS 3025
    key = "gmcos3025",
    config = {
        extra = {
            mult = 5,
            odds = 1000,
            odds2 = 6,
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'GMC-OS 3025',
        ['text'] = {
            [1] = '{C:red}+15{} Mult',
            [2] = '{C:green}#3# in #4#{} chance for {X:red,C:white}X15{} Mult',
            [3] = '{C:green}#1# in #2#{} chance to {C:red}destroy{} this card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_gmcos3025')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_terminus_gmcos3025')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_c826efdc', 1, card.ability.extra.odds, 'j_terminus_gmcos3025') then
                      SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                  end
                    if SMODS.pseudorandom_probability(card, 'group_1_428288b9', 1, card.ability.extra.odds2, 'j_terminus_gmcos3025') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
                        return true
                    end
                }
            end
        end
    end
}
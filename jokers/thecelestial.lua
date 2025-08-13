SMODS.Joker{ --The Celestial
    key = "thecelestial",
    config = {
        extra = {
            dim1 = 0,
            dim2 = 0,
            dim3 = 0,
            dim4 = 0,
            dim5 = 0,
            dim6 = 0,
            dim7 = 0,
            dim8 = 0.1,
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Celestial',
        ['text'] = {
            [1] = 'Dimensions activate from {X:spectral,C:white}high{} to {C:common}low{}',
            [2] = 'when an {C:attention}8{} is scored',
            [3] = 'The {C:common}first dimension{} produces {C:red}+Mult{}',
            [4] = 'Other dimensions produce the dimension',
            [5] = 'of the tier one lower than it',
            [6] = '{C:inactive}(Currently: {}{C:red}+0{}{C:inactive} Mult){}',
            [7] = '',
            [8] = 'Your dimensions: {C:common}#1#{}, {C:uncommon}#2#{}, {C:rare}#3#{}, {C:spades}#4#{},',
            [9] = '{C:legendary}#5#{}, {C:dark_edition}#6#{}, {C:enhanced}#7#{}, {X:enhanced,C:white}#8#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 5
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dim1, card.ability.extra.dim2, card.ability.extra.dim3, card.ability.extra.dim4, card.ability.extra.dim5, card.ability.extra.dim6, card.ability.extra.dim7, card.ability.extra.dim8}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 8 then
                card.ability.extra.dim7 = (card.ability.extra.dim7) + card.ability.extra.dim8
                card.ability.extra.dim6 = (card.ability.extra.dim6) + card.ability.extra.dim7
                card.ability.extra.dim5 = (card.ability.extra.dim5) + card.ability.extra.dim6
                card.ability.extra.dim4 = (card.ability.extra.dim4) + card.ability.extra.dim5
                card.ability.extra.dim3 = (card.ability.extra.dim3) + card.ability.extra.dim4
                card.ability.extra.dim2 = (card.ability.extra.dim2) + card.ability.extra.dim3
                card.ability.extra.dim1 = (card.ability.extra.dim1) + card.ability.extra.dim2
                card.ability.extra.jscale = (card.ability.extra.jscale) + card.ability.extra.dim1
                return {
                    chips = card.ability.extra.jscale
                }
            end
        end
    end
}
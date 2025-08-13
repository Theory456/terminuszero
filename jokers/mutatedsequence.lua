SMODS.Joker{ --Mutated Sequence
    key = "mutatedsequence",
    config = {
        extra = {
            pb_mult_c1d720ae = 6,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mutated Sequence',
        ['text'] = {
            [1] = 'Played {C:attention}6s{} permanently gain a',
            [2] = 'bonus of {C:red}+6{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_c1d720ae
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
    end
}
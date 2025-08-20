SMODS.Joker{ --Broken Sequence
    key = "brokensequence",
    config = {
        extra = {
            pb_mult_833f17e8 = 6,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Broken Sequence',
        ['text'] = {
            [1] = '{C:enhanced}Enhanced{} 6s gain an extra permanent',
            [2] = 'bonus {C:red}+6{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
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
            if (context.other_card:get_id() == 6 and (function()
        local enhancements = SMODS.get_enhancements(context.other_card)
        for k, v in pairs(enhancements) do
            if v then
                return true
            end
        end
        return false
    end)()) then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_833f17e8
                return {
                    extra = { message = "Upgrade!", colour = G.C.MULT }, card = card
                }
            end
        end
    end
}
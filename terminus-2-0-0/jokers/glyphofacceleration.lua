SMODS.Joker{ --Glyph of Acceleration
    key = "glyphofacceleration",
    config = {
        extra = {
            mlt = 0,
            dm2 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Acceleration',
        ['text'] = {
            [1] = '{C:red}+#2#{} Mult per card scored when',
            [2] = 'a card is scored, which itself',
            [3] = 'scales by {C:red}+0.01{} when a card',
            [4] = 'is scored, {C:red}does not reset{}',
            [5] = '{C:inactive}(Currently: {}{C:red}+#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mlt, card.ability.extra.dm2}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.dm2 = (card.ability.extra.dm2) + 0.01
                card.ability.extra.mlt = (card.ability.extra.mlt) + card.ability.extra.dm2
                return {
                    mult = card.ability.extra.mlt
                }
        end
    end
}
SMODS.Joker{ --Glyph of Velocity
    key = "glyphofvelocity",
    config = {
        extra = {
            mlt = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Velocity',
        ['text'] = {
            [1] = '{C:red}+0.1{} Mult per card scored when',
            [2] = 'a card is scored, {C:red}does not reset{}',
            [3] = '{C:inactive}(Currently: {}{C:red}+#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mlt}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.mlt = (card.ability.extra.mlt) + 0.1
                return {
                    mult = card.ability.extra.mlt
                }
        end
    end
}
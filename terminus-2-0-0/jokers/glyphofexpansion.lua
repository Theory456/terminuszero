SMODS.Joker{ --Glyph of Expansion
    key = "glyphofexpansion",
    config = {
        extra = {
            mlt = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Expansion',
        ['text'] = {
            [1] = '{C:blue}+10{} Chips per hand played when a',
            [2] = 'hand is played, {C:red}does not reset{}',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
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
        x = 8,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mlt}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                card.ability.extra.mlt = (card.ability.extra.mlt) + 10
                return {
                    chips = card.ability.extra.mlt
                }
        end
    end
}
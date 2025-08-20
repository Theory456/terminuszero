SMODS.Joker{ --Glyph of Multiplicity
    key = "glyphofmultiplicity",
    config = {
        extra = {
            chs = 2
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Multiplicity',
        ['text'] = {
            [1] = 'Repeat {C:attention}poker hands{} trigger this card',
            [2] = 'and {X:attention,C:white}double{} the {C:blue}+Chips{} value of it',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        x = 0,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chs}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                card.ability.extra.chs = (card.ability.extra.chs) * 2
                return {
                    chips = card.ability.extra.chs
                }
            end
        end
    end
}
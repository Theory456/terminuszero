SMODS.Joker{ --Splodey Joker
    key = "splodeyjoker",
    config = {
        extra = {
            jbase = 1
        }
    },
    loc_txt = {
        ['name'] = 'Splodey Joker',
        ['text'] = {
            [1] = '{C:blue}+#1# {} Chips per card scored, the value becomes a',
            [2] = 'random number between 1 and 25 when triggered'
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jbase}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.jbase = pseudorandom('jbase_4230f615', 1, 25)
                return {
                    chips = card.ability.extra.jbase
                }
        end
    end
}
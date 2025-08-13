SMODS.Joker{ --Supersplode Joker
    key = "supersplodejoker",
    config = {
        extra = {
            jbase = 1
        }
    },
    loc_txt = {
        ['name'] = 'Supersplode Joker',
        ['text'] = {
            [1] = '{C:blue}+#1# {} Chips per card scored, the value adds a',
            [2] = 'random number between 1 and 10 when triggered'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    cost = 7,
    rarity = 2,
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
                card.ability.extra.jbase = (card.ability.extra.jbase) + pseudorandom('jbase_4230f615', 1, 10)
                return {
                    chips = card.ability.extra.jbase
                }
        end
    end
}
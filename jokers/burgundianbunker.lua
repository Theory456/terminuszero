SMODS.Joker{ --Burgundian Bunker
    key = "burgundianbunker",
    config = {
        extra = {
            Xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Burgundian Bunker',
        ['text'] = {
            [1] = 'Played 2s through 5s give {X:red,C:white}X5{} Mult',
            [2] = '{C:red}-3{} Joker Slots while held',
            [3] = '{C:inactive}(Who decided this was a good idea?){}{}'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 3)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 3
    end
}
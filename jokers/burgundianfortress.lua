SMODS.Joker{ --Burgundian Fortress
    key = "burgundianfortress",
    config = {
        extra = {
            currentmoney = 1
        }
    },
    loc_txt = {
        ['name'] = 'Burgundian Fortress',
        ['text'] = {
            [1] = 'Played 2s through 5s give {X:red,C:white}XMult{} equal',
            [2] = 'to the {C:money}money{} you own during the Blind',
            [3] = '{C:red}Destroy{} all other cards when scored',
            [4] = '{C:red}-3{} Joker Slots while held',
            [5] = '{C:inactive}(Who decided this was a good idea?){}{}'
        }
    },
    pos = {
        x = 7,
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
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            context.other_card.should_destroy = false
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5) then
                return {
                    Xmult = card.ability.extra.currentmoney + (G.GAME.dollars)
                }
            elseif (not (context.other_card:get_id() == 2) and not (context.other_card:get_id() == 3) and not (context.other_card:get_id() == 4) and not (context.other_card:get_id() == 5)) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
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
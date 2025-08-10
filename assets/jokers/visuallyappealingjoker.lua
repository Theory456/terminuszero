SMODS.Joker{ --Visually Appealing Joker
    key = "visuallyappealingjoker",
    config = {
        extra = {
            currentmoney = 1
        }
    },
    loc_txt = {
        ['name'] = 'Visually Appealing Joker',
        ['text'] = {
            [1] = 'Played {C:attention}face cards{} give {X:red,C:white}XMult{} equal',
            [2] = 'to the {C:money}money{} you own during the Blind',
            [3] = '{C:red}Destroy{} all scored{C:attention} number cards{}',
            [4] = '{C:red}-3{} Joker Slots while held'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    cost = 25,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                return {
                    Xmult = card.ability.extra.currentmoney + (G.GAME.dollars)
                }
            elseif not (context.other_card:is_face()) then
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
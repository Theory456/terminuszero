SMODS.Joker{ --That Is Not Chicot!
    key = "thatisnotchicot",
    config = {
        extra = {
            req = 4,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'That Is Not Chicot!',
        ['text'] = {
            [1] = 'Sell this card to... do {C:red}nothing{}',
            [2] = 'Selling this Joker after',
            [3] = 'defeating {C:attention}4{} {C:inactive}(#1#){} Boss Blinds',
            [4] = 'will fix the {C:red}problem{} with it'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.req}}
    end,

    calculate = function(self, card, context)
        if context.selling_self  then
            if (card.ability.extra.req or 0) == 0 then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_chicot' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if (card.ability.extra.req or 0) ~= 0 then
                return {
                    func = function()
                    card.ability.extra.req = math.max(0, (card.ability.extra.req) - 1)
                    return true
                end
                }
            end
        end
    end
}
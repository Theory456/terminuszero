SMODS.Joker{ --That Is Not Perkeo!
    key = "thatisnotperkeo",
    config = {
        extra = {
            req = 69,
            ignore = 0,
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'That Is Not Perkeo!',
        ['text'] = {
            [1] = 'Create {C:tarot}The Emperor{} for',
            [2] = 'every {C:attention}#2#{} scored',
            [3] = '{C:inactive}(Must have room, poker hand',
            [4] = '{C:inactive}changes every round, and will not work{}',
            [5] = '{C:inactive}if the below effect can be performed){}{}',
            [6] = 'Selling this Joker after using {C:attention}69{} {C:inactive}(#1#){}',
            [7] = 'Consumables will fix the {C:red}problem{} with it'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        return {vars = {card.ability.extra.req, card.ability.extra.Tarot}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.hand_hand = 'High Card'
    end,

    calculate = function(self, card, context)
        if context.selling_self  then
            if (card.ability.extra.req or 0) == 0 then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_perkeo' })
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
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == G.GAME.current_round.hand_hand and (card.ability.extra.req or 0) ~= 0) then
                local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Tarot', key = 'c_emperor', key_append = 'joker_forge_tarot'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                local hand_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if G.GAME.hands[handname].visible then
                        hand_hands[#hand_hands + 1] = handname
                    end
                end
                if hand_hands[1] then
                    G.GAME.current_round.hand_hand = pseudorandom_element(hand_hands, pseudoseed('hand' .. G.GAME.round_resets.ante))
                end
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil
                }
            end
        end
        if context.using_consumeable  then
                return {
                    func = function()
                    card.ability.extra.req = math.max(0, (card.ability.extra.req) - 1)
                    return true
                end
                }
        end
    end
}
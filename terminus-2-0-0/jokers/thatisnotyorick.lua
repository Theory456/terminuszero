SMODS.Joker{ --That Is Not Yorick!
    key = "thatisnotyorick",
    config = {
        extra = {
            unfunity = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'That Is Not Yorick!',
        ['text'] = {
            [1] = 'This Joker gains an {C:enhanced}Unfunity Point{}',
            [2] = 'when a {C:red}discard{} is used',
            [3] = '{C:inactive}(Currently: {}{C:enhanced,s:1.2}#1#{}{C:inactive}/42 Unfunity Points){}',
            [4] = 'Sell this Joker after gaining {C:attention}69{}',
            [5] = '{C:enhanced}Unfunity Points{} to fix the {C:red}problem{} with it'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.unfunity}}
    end,

    calculate = function(self, card, context)
        if context.pre_discard  then
                return {
                    func = function()
                    card.ability.extra.unfunity = (card.ability.extra.unfunity) + 1
                    return true
                end,
                    message = "Charge!"
                }
        end
        if context.selling_self  then
            if ((card.ability.extra.unfunity or 0) >= 42 and (card.ability.extra.unfunity or 0) < 84) then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_yorick' })
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
            elseif (card.ability.extra.unfunity or 0) >= 84 then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_teu_anglerais' })
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
    end
}
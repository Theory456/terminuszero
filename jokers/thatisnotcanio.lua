SMODS.Joker{ --That Is Not Canio!
    key = "thatisnotcanio",
    config = {
        extra = {
            req = 12,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'That Is Not Canio!',
        ['text'] = {
            [1] = '{C:red}Destroy{} a discarded hand if the',
            [2] = 'hand contains only {C:attention}face cards{}',
            [3] = 'while the below effect is useless{}',
            [4] = 'Selling this Joker after',
            [5] = 'destroying {C:attention}12{} {C:inactive}(#1#){} face cards',
            [6] = 'will fix the {C:red}problem{} with it'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_caino' })
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
        if context.discard  then
            if ((function()
    local rankFound = false
    for i, c in ipairs(context.full_hand) do
        if c:is_face() then
            rankFound = true
            break
        end
    end
    
    return rankFound
end)() and context.other_card:is_face() and (card.ability.extra.req or 0) ~= 0) then
                return {
                    remove = true,
                  message = "Destroyed!",
                    extra = {
                        func = function()
                    card.ability.extra.req = math.max(0, (card.ability.extra.req) - 1)
                    return true
                end,
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}
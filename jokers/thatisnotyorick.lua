SMODS.Joker{ --That Is Not Yorick!
    key = "thatisnotyorick",
    config = {
        extra = {
            jscale = 0,
            req = 69,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'That Is Not Yorick!',
        ['text'] = {
            [1] = '{C:red}+0.4{} Mult per card discarded',
            [2] = '{C:inactive}(maxed out at {}{C:red}+27.6{}{C:inactive}, currently {}{C:red}+#1#{}{C:inactive}){}',
            [3] = 'Selling this Joker after {C:attention}maxing it out{}',
            [4] = 'will fix the {C:red}problem{} with it'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        return {vars = {card.ability.extra.jscale}}
    end,

    calculate = function(self, card, context)
        if context.discard  then
            if (card.ability.extra.req or 0) ~= 0 then
                return {
                    func = function()
                    card.ability.extra.req = math.max(0, (card.ability.extra.req) - 1)
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) + 0.4
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
        if context.selling_self  then
            if (card.ability.extra.req or 0) == 0 then
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
            end
        end
    end
}
SMODS.Joker{ --That Is Not Triboulet!
    key = "thatisnottriboulet",
    config = {
        extra = {
            req = 42,
            mult = 7,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'That Is Not Triboulet!',
        ['text'] = {
            [1] = 'Scored Kings and Queens give {C:red}+4{} Mult while',
            [2] = 'the below effect is useless',
            [3] = 'Sell this Joker after scoring {C:attention}42{} {C:inactive}(#1#){} Kings',
            [4] = 'or Queens to fix the problem with it'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_triboulet' })
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
        if context.individual and context.cardarea == G.play  then
            if ((card.ability.extra.req or 0) ~= 0 and (context.other_card:get_id() == 12 or context.other_card:get_id() == 13)) then
                card.ability.extra.req = math.max(0, (card.ability.extra.req) - 1)
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
SMODS.Joker{ --Discovery
    key = "discovery",
    config = {
        extra = {
            rnds = 4,
            Spectral = 0
        }
    },
    loc_txt = {
        ['name'] = 'Discovery',
        ['text'] = {
            [1] = 'Selling this card after 4 {C:inactive}(#1#){} {C:attention}Boss Blinds{}',
            [2] = 'will create a {C:edition}Negative{} {C:spectral}Soul{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.rnds}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if (card.ability.extra.rnds or 0) ~= 0 then
                return {
                    func = function()
                    card.ability.extra.rnds = math.max(0, (card.ability.extra.rnds) - 1)
                    return true
                end
                }
            end
        end
        if context.selling_self  then
            if (card.ability.extra.rnds or 0) == 0 then
                return {
                    func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Spectral', key = 'c_soul', edition = 'e_negative', key_append = 'joker_forge_spectral'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end
                }
            end
        end
    end
}
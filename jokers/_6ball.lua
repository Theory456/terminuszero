SMODS.Joker{ --6 Ball
    key = "_6ball",
    config = {
        extra = {
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = '6 Ball',
        ['text'] = {
            [1] = 'Scored {C:attention}6s{} create',
            [2] = '{C:tarot}Wheel of Fortune{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Tarot', key = 'c_wheel_of_fortune', key_append = 'joker_forge_tarot'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil
                }
            end
        end
    end
}
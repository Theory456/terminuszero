SMODS.Consumable {
    key = 'avira',
    set = 'Spectral',
    pos = { x = 0, y = 0 },
    config = { extra = {
        consumable_count = 2
    } },
    loc_txt = {
        name = 'Avira',
        text = {
        [1] = 'Creates up to {C:attention}2{} random {C:spectral}Spectral{} cards',
        [2] = '{C:inactive}(Must have room){}'
    }
    },
    cost = 6,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral' })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Joker{ --The Winery
    key = "thewinery",
    config = {
        extra = {
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Winery',
        ['text'] = {
            [1] = '{C:enhanced}Aegean Cards{} create a random',
            [2] = '{C:edition}Negative{} {C:tarot}Tarot Card{} when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 4
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = nil, edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil
                }
            end
        end
    end
}
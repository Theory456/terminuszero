SMODS.Joker{ --The Survivor
    key = "thesurvivor",
    config = {
        extra = {
            Spectral = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Survivor',
        ['text'] = {
            [1] = '{C:red}-2{} hand size',
            [2] = 'Playing a hand containing a {C:attention}Five of a Kind{}',
            [3] = 'creates a {C:edition}Negative{} {C:planet}Black Hole{}',
            [4] = '{C:inactive}(Nice to see you again...{}',
            [5] = '{C:inactive}You\'re nerfed tho){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Five of a Kind"]) then
                local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Spectral', key = 'c_black_hole', edition = 'e_negative', key_append = 'joker_forge_spectral'}
                        return true
                    end
                }))
                return {
                    message = created_consumable and localize('k_plus_spectral') or nil
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-2)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(2)
    end
}
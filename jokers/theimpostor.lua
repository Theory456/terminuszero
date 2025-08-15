SMODS.Joker{ --The Impostor
    key = "theimpostor",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Impostor',
        ['text'] = {
            [1] = '{C:enhanced}Aegean{} {C:attention}Kings{} of {C:hearts}Hearts{} {C:attention}duplicate{}',
            [2] = 'when scored in a {C:attention}Five of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 1
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.scoring_name == "Five of a Kind" and SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true and context.other_card:get_id() == 13 and context.other_card:is_suit("Hearts")) then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(copied_card)
                table.insert(G.playing_cards, copied_card)
                playing_card_joker_effects({true})
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Copied Card!"
                }
            end
        end
    end
}
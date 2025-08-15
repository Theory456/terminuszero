SMODS.Joker{ --The Infinity
    key = "theinfinity",
    config = {
        extra = {
            energy = 0,
            Spectral = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Infinity',
        ['text'] = {
            [1] = 'Scoring an {C:enhanced}Aegean Card{} fills',
            [2] = 'the Energy of this card',
            [3] = 'Once this card\'s Energy reaches {C:attention}100{},',
            [4] = 'sell it to create a {C:edition}Negative{} {C:spectral}Soul{}',
            [5] = '',
            [6] = '{C:inactive}(Energy: {}{s:1.5}#1#{}{C:inactive}/25){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
    soul_pos = {
        x = 9,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.energy}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                card.ability.extra.energy = (card.ability.extra.energy) + 1
            end
        end
        if context.selling_self  then
            if (card.ability.extra.energy or 0) >= 100 then
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
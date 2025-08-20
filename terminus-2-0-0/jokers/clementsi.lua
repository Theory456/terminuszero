SMODS.Joker{ --Clementsi
    key = "clementsi",
    config = {
        extra = {
            mlt = 1,
            dollars = 24,
            Spectral = 0
        }
    },
    loc_txt = {
        ['name'] = 'Clementsi',
        ['text'] = {
            [1] = 'Create a {C:dark_edition}Negative{} {C:spectral}Avira{} and',
            [2] = '{C:spectral}The Wraith{} at the end of the {C:attention}shop{}',
            [3] = '{C:spectral}The Wraith{} now sets money to {C:money}$24{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 80,
    rarity = "teu_superior",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 0
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.ending_shop  then
                return {
                    func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Spectral', key = 'c_teu_avira', edition = 'e_negative', key_append = 'joker_forge_spectral'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end,
                    extra = {
                        func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Spectral', key = 'c_wraith', edition = 'e_negative', key_append = 'joker_forge_spectral'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end,
                        colour = G.C.SECONDARY_SET.Spectral
                        }
                }
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Spectral' and context.consumeable.config.center.key == 'c_wraith' then
                return {
                    func = function()
                    local target_amount = card.ability.extra.dollars
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Edit!", colour = G.C.MONEY})
                    return true
                end
                }
            end
        end
    end
}
SMODS.Joker{ --The Spice
    key = "thespice",
    config = {
        extra = {
            active = 0,
            pb_x_mult_25d61b55 = 1.5,
            perma_x_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Spice',
        ['text'] = {
            [1] = 'The first {C:enhanced}Aegean Card{} in a hand {C:red}self-destructs{}',
            [2] = 'Cards scored after the first {C:enhanced}Aegean Card{}',
            [3] = 'in a single hand become {C:edition}Polychrome{}',
            [4] = 'and gain an extra permanent {X:red,C:white}X1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
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
        y = 3
    },

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true and (card.ability.extra.active or 0) == 0) then
                context.other_card.should_destroy = true
                card.ability.extra.active = 1
                return {
                    message = "Destroyed!"
                }
            elseif (card.ability.extra.active or 0) == 1 then
                context.other_card:set_edition("e_polychrome", true)
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.pb_x_mult_25d61b55
                return {
                    message = "Card Modified!",
                    extra = {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card,
                        colour = G.C.MULT
                        }
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
                return {
                    func = function()
                    card.ability.extra.active = 0
                    return true
                end
                }
        end
    end
}
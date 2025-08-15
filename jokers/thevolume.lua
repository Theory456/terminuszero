SMODS.Joker{ --The Volume
    key = "thevolume",
    config = {
        extra = {
            jscale = 1.1,
            perma_h_x_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Volume',
        ['text'] = {
            [1] = 'Adds {X:red,C:white}X0.1{} Mult to played {C:enhanced}Aegean Cards{}',
            [2] = 'for every time this card has been triggered',
            [3] = 'The {X:red,C:white}XMult{} from this effect applies',
            [4] = 'when the {C:enhanced}Aegean Card{} is held in hand',
            [5] = '{C:inactive}(Currently: {}{X:red,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        x = 3,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jscale}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                local jscale_value = card.ability.extra.jscale
                context.other_card.ability.perma_h_x_mult = context.other_card.ability.perma_h_x_mult or 0
                context.other_card.ability.perma_h_x_mult = context.other_card.ability.perma_h_x_mult + jscale_value
                card.ability.extra.jscale = (card.ability.extra.jscale) + 0.1
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
    end
}
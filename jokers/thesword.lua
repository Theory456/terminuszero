SMODS.Joker{ --The Sword
    key = "thesword",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Sword',
        ['text'] = {
            [1] = 'Scored {C:enhanced}Aegean Cards{} give {C:red}+5{} Mult',
            [2] = 'per {C:enhanced}Aegean Card{} scored',
            [3] = '{C:inactive}(Currently: {}{C:red}+#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jscale}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                card.ability.extra.jscale = (card.ability.extra.jscale) + 5
                return {
                    mult = card.ability.extra.jscale
                }
            end
        end
    end
}
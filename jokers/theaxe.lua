SMODS.Joker{ --The Axe
    key = "theaxe",
    config = {
        extra = {
            emult = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'The Axe',
        ['text'] = {
            [1] = 'Played {C:enhanced}Aegean Cards{} give {X:enhanced,C:white}^1.3{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
        x = 3,
        y = 0
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                return {
                    e_mult = card.ability.extra.emult
                }
            end
        end
    end
}
SMODS.Joker{ --The Lady
    key = "thelady",
    config = {
        extra = {
            echips = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'The Lady',
        ['text'] = {
            [1] = 'Aegean Cards give {X:enhanced,C:white}^1.1{} Chips',
            [2] = 'when scored in a {C:attention}Straight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
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
        y = 2
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.scoring_name == "Straight" and SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true) then
                return {
                    e_chips = card.ability.extra.echips
                }
            end
        end
    end
}
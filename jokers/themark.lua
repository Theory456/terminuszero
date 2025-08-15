SMODS.Joker{ --The Mark
    key = "themark",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Mark',
        ['text'] = {
            [1] = 'When inside the {C:attention}Boss Blind{} of',
            [2] = 'the same name and symbol,',
            [3] = 'first played cards in every hand',
            [4] = 'become {C:edition}Polychrome{} {C:enhanced}Aegean Cards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        x = 5,
        y = 2
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and G.GAME.blind.name == "The Mark") then
                context.other_card:set_ability(G.P_CENTERS.m_terminus_aegean)
                context.other_card:set_edition("e_polychrome", true)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}
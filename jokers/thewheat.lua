SMODS.Joker{ --The Wheat
    key = "thewheat",
    config = {
        extra = {
            discardsremaining = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Wheat',
        ['text'] = {
            [1] = 'Scored {C:enhanced}Aegean Cards{} give {C:money}money{}',
            [2] = 'based on remaining {C:red}discards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
        y = 4
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                return {
                    dollars = G.GAME.current_round.discards_left
                }
            end
        end
    end
}
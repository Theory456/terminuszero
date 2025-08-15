SMODS.Joker{ --The Barley
    key = "thebarley",
    config = {
        extra = {
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Barley',
        ['text'] = {
            [1] = '{C:enhanced}Aegean Cards{} {C:planet}level up{} the',
            [2] = 'scored {C:attention}poker hands{} they are in'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        x = 5,
        y = 0
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                target_hand = "High Card"
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}
SMODS.Joker{ --The Minister
    key = "theminister",
    config = {
        extra = {
            emult = 1.14
        }
    },
    loc_txt = {
        ['name'] = 'The Minister',
        ['text'] = {
            [1] = 'Played 10s through Aces give {X:tarot,C:white}^1.14{} Mult'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    cost = 2,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 10 and (context.other_card:is_face() or context.other_card:get_id() == 14)) then
                return {
                    e_mult = card.ability.extra.emult
                }
            end
        end
    end
}
SMODS.Joker{ --The Monarch
    key = "themonarch",
    config = {
        extra = {
            mult = 10
        }
    },
    loc_txt = {
        ['name'] = 'The Monarch',
        ['text'] = {
            [1] = 'Played 10s through Aces give {C:red}+10{} Mult'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 10 and (context.other_card:is_face() or context.other_card:get_id() == 14)) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
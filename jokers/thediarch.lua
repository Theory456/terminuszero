SMODS.Joker{ --The Diarch
    key = "thediarch",
    config = {
        extra = {
            mult = 5,
            chips = 25
        }
    },
    loc_txt = {
        ['name'] = 'The Diarch',
        ['text'] = {
            [1] = 'Played 10s through Aces give',
            [2] = '{C:red}+5{} Mult and {C:blue}+25{} Chips'
        }
    },
    pos = {
        x = 2,
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
                    mult = card.ability.extra.mult,
                    extra = {
                        chips = card.ability.extra.chips,
                        colour = G.C.CHIPS
                        }
                }
            end
        end
    end
}
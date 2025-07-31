SMODS.Joker{ --The Musketeers
    key = "themusketeers",
    config = {
        extra = {
            mult = 9,
            mult2 = 9,
            mult3 = 9,
            mult4 = 9
        }
    },
    loc_txt = {
        ['name'] = 'The Musketeers',
        ['text'] = {
            [1] = 'Played 2s through 5s give {C:red}+9{} Mult',
            [2] = 'when scored as part of a {C:attention}Three of a Kind{}'
        }
    },
    pos = {
        x = 3,
        y = 0
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
            if (context.other_card:get_id() == 2 and context.scoring_name == "Three of a Kind") then
                return {
                    mult = card.ability.extra.mult
                }
            elseif (context.other_card:get_id() == 3 and context.scoring_name == "Three of a Kind") then
                return {
                    mult = card.ability.extra.mult2
                }
            elseif (context.other_card:get_id() == 4 and context.scoring_name == "Three of a Kind") then
                return {
                    mult = card.ability.extra.mult3
                }
            elseif (context.other_card:get_id() == 5 and context.scoring_name == "Three of a Kind") then
                return {
                    mult = card.ability.extra.mult4
                }
            end
        end
    end
}
SMODS.Joker{ --The Bartender
    key = "thebartender",
    config = {
        extra = {
            jtotal = 0,
            mult = 13,
            mult2 = 13,
            mult3 = 13,
            mult4 = 13
        }
    },
    loc_txt = {
        ['name'] = 'The Bartender',
        ['text'] = {
            [1] = 'Played 2s through 5s give {C:red}+13{} Mult for',
            [2] = 'as long as the rank total for these',
            [3] = 'triggered cards does not exceed {C:attention}13{}',
            [4] = '{C:red}Destroy{} this joker if this does not hold'
        }
    },
    pos = {
        x = 5,
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
            if context.other_card:get_id() == 2 then
                card.ability.extra.jtotal = (card.ability.extra.jtotal) + 2
                return {
                    mult = card.ability.extra.mult
                }
            elseif context.other_card:get_id() == 3 then
                card.ability.extra.jtotal = (card.ability.extra.jtotal) + 3
                return {
                    mult = card.ability.extra.mult2
                }
            elseif context.other_card:get_id() == 4 then
                card.ability.extra.jtotal = (card.ability.extra.jtotal) + 4
                return {
                    mult = card.ability.extra.mult3
                }
            elseif context.other_card:get_id() == 5 then
                card.ability.extra.jtotal = (card.ability.extra.jtotal) + 5
                return {
                    mult = card.ability.extra.mult4
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if (card.ability.extra.jtotal or 0) > 13 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            elseif (card.ability.extra.jtotal or 0) <= 13 then
                return {
                    func = function()
                    card.ability.extra.jtotal = 0
                    return true
                end
                }
            end
        end
    end
}
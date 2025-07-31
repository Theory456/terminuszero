SMODS.Joker{ --The Peasant
    key = "thepeasant",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Peasant',
        ['text'] = {
            [1] = 'Played 2s through 5s give {C:blue}+2{}',
            [2] = 'Chips for every {C:attention}Blind{} selected',
            [3] = '{C:inactive}(Currently: {}{C:blue}+#1# {}{C:inactive}Chips){}'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jscale}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 2 then
                return {
                    chips = card.ability.extra.jscale
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    chips = card.ability.extra.jscale
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    chips = card.ability.extra.jscale
                }
            elseif context.other_card:get_id() == 5 then
                return {
                    chips = card.ability.extra.jscale
                }
            end
        end
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) + 2
                    return true
                end
                }
        end
    end
}
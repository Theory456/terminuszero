SMODS.Joker{ --The Farmer
    key = "thefarmer",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Farmer',
        ['text'] = {
            [1] = 'Played 2s through 5s give {C:red}+0.4{} Mult',
            [2] = 'for every {C:attention}Blind{} selected',
            [3] = '{C:inactive}(Currently: {}{C:red}+#1# {}{C:inactive}Mult){}'
        }
    },
    pos = {
        x = 2,
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
                    mult = card.ability.extra.jscale
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    mult = card.ability.extra.jscale
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    mult = card.ability.extra.jscale
                }
            elseif context.other_card:get_id() == 5 then
                return {
                    mult = card.ability.extra.jscale
                }
            end
        end
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) + 0.4
                    return true
                end
                }
        end
    end
}
SMODS.Joker{ --Part-Time Salesperson
    key = "parttimesalesperson",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'Part-Time Salesperson',
        ['text'] = {
            [1] = 'Played 2s through 5s give {C:red}+1{} Mult',
            [2] = 'for every {C:attention}Blind{} skipped',
            [3] = '{C:inactive}(Currently: {}{C:red}+#1# {}{C:inactive}Mult){}'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
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
                    card.ability.extra.jscale = (card.ability.extra.jscale) + 1
                    return true
                end
                }
        end
    end
}
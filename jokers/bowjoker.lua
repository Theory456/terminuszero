SMODS.Joker{ --Bow Joker
    key = "bowjoker",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bow Joker',
        ['text'] = {
            [1] = 'Played {C:attention}Two Pairs{} give {C:red}+4{} Mult',
            [2] = 'for every {C:attention}Blind{} selected',
            [3] = '{C:inactive}(Currently: {}{C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 1,
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
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.jscale = (card.ability.extra.jscale) + 4
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Two Pair" then
                return {
                    mult = card.ability.extra.jscale
                }
            end
        end
    end
}
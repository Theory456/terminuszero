SMODS.Joker{ --Unarmed Joker
    key = "unarmedjoker",
    config = {
        extra = {
            jscale = 1
        }
    },
    loc_txt = {
        ['name'] = 'Unarmed Joker',
        ['text'] = {
            [1] = 'Played {C:attention}Nones{} give {X:red,C:white}X1.1{} Mult',
            [2] = 'for every {C:attention}Blind{} selected',
            [3] = '{C:inactive}(Currently: {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    cost = 1,
    rarity = 3,
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
                    card.ability.extra.jscale = (card.ability.extra.jscale) + 0.1
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if #context.scoring_hand == 0 then
                return {
                    Xmult = card.ability.extra.jscale
                }
            end
        end
    end
}
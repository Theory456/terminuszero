SMODS.Joker{ --The Quettaccelerator
    key = "thequettaccelerator",
    config = {
        extra = {
            jscale = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Quettaccelerator',
        ['text'] = {
            [1] = 'Played 2s give a multiplicative',
            [2] = '{X:red,C:white}X1.1{} Mult',
            [3] = '{C:inactive}(Currently: {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    cost = 2,
    rarity = 4,
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
                card.ability.extra.jscale = (card.ability.extra.jscale) * 1.1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.jscale
                }
        end
    end
}
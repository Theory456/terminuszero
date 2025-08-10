SMODS.Joker{ --Turquoise Loop
    key = "turquoiseloop",
    config = {
        extra = {
            currenthours = 0
        }
    },
    loc_txt = {
        ['name'] = 'Turquoise Loop',
        ['text'] = {
            [1] = '{C:red}+Mult{} equal to the {C:attention}current hour{}',
            [2] = '{C:inactive}(Currently: {C:red}+#1#{}{C:inactive} Mult){}'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {os.date("*t", os.time()).hour}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = os.date("*t", os.time()).hour
                }
        end
    end
}
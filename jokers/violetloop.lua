SMODS.Joker{ --Violet Loop
    key = "violetloop",
    config = {
        extra = {
            currentmonth = 0
        }
    },
    loc_txt = {
        ['name'] = 'Violet Loop',
        ['text'] = {
            [1] = '{C:red}+Mult{} equal to the {C:attention}current month{}',
            [2] = '{C:inactive}(Currently: {C:red}+#1#{}{C:inactive} Mult){}'
        }
    },
    pos = {
        x = 2,
        y = 5
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
        return {vars = {os.date("*t", os.time()).month}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = os.date("*t", os.time()).month
                }
        end
    end
}
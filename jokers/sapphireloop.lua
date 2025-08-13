SMODS.Joker{ --Sapphire Loop
    key = "sapphireloop",
    config = {
        extra = {
            currentday = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sapphire Loop',
        ['text'] = {
            [1] = '{C:blue}+Chips{} equal to the {C:attention}current day{}',
            [2] = '{C:inactive}(Currently: {C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
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
        return {vars = {os.date("*t", os.time()).day}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = os.date("*t", os.time()).day
                }
        end
    end
}
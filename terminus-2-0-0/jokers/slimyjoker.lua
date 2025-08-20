SMODS.Joker{ --Slimy Joker
    key = "slimyjoker",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Slimy Joker',
        ['text'] = {
            [1] = '{C:blue}+Chips{} equal to the current Ante',
            [2] = 'multiplied by a factor of {C:attention}6{}',
            [3] = 'if played hand contains a {C:attention}Pair{}',
            [4] = 'This gives {X:attention,C:white}X3{} for {C:attention}Big Blinds{}',
            [5] = 'and {X:attention,C:white}X5{} for {C:attention}Boss Blinds{}',
            [6] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (next(context.poker_hands["Pair"]) and G.GAME.blind:get_type() == 'Small') then
                return {
                    chips = (G.GAME.round_resets.ante) * 6
                }
            elseif (next(context.poker_hands["Pair"]) and G.GAME.blind:get_type() == 'Big') then
                return {
                    chips = (G.GAME.round_resets.ante) * 18
                }
            elseif (next(context.poker_hands["Pair"]) and G.GAME.blind.boss) then
                return {
                    chips = (G.GAME.round_resets.ante) * 30
                }
            end
        end
    end
}
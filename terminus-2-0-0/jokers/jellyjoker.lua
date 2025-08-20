SMODS.Joker{ --Jelly Joker
    key = "jellyjoker",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jelly Joker',
        ['text'] = {
            [1] = '{C:red}+Mult{} equal to the current {C:attention}Ante{}',
            [2] = 'if played hand contains a {C:attention}Pair{}',
            [3] = 'This gives {X:attention,C:white}X3{} for {C:attention}Big Blinds{}',
            [4] = 'and {X:attention,C:white}X5{} for {C:attention}Boss Blinds{}',
            [5] = '{C:inactive}(Currently: {}{C:red}+#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {(G.GAME.round_resets.ante or 0)}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (next(context.poker_hands["Pair"]) and G.GAME.blind:get_type() == 'Small') then
                return {
                    mult = G.GAME.round_resets.ante
                }
            elseif (next(context.poker_hands["Pair"]) and G.GAME.blind:get_type() == 'Big') then
                return {
                    mult = (G.GAME.round_resets.ante) * 3
                }
            elseif (next(context.poker_hands["Pair"]) and G.GAME.blind.boss) then
                return {
                    mult = (G.GAME.round_resets.ante) * 5
                }
            end
        end
    end
}
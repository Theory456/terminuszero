SMODS.Joker{ --Gravitron Joker
    key = "gravitronjoker",
    config = {
        extra = {
            jscale = 0,
            dollars = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gravitron Joker',
        ['text'] = {
            [1] = 'Repeat poker hands give {C:money}$1{} when scored'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}
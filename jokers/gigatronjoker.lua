SMODS.Joker{ --Gigatron Joker
    key = "gigatronjoker",
    config = {
        extra = {
            jscale = 1,
            Xmult = 2,
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = 'Gigatron Joker',
        ['text'] = {
            [1] = 'Repeat poker hands give {X:red,C:white}X2{} Mult',
            [2] = 'and {C:money}$2{} when scored'
        }
    },
    pos = {
        x = 5,
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
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        dollars = card.ability.extra.dollars,
                        colour = G.C.MONEY
                        }
                }
            end
        end
    end
}
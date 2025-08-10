SMODS.Joker{ --The Dyson Sphere
    key = "thedysonsphere",
    config = {
        extra = {
            Xmult = 2,
            Xmult2 = 3,
            Xmult3 = 3,
            Xmult4 = 2,
            Xmult5 = 4,
            Xmult6 = 3.5,
            Xmult7 = 2.5,
            Xmult8 = 5,
            Xmult9 = 5,
            Xmult10 = 9,
            Xmult11 = 9,
            Xmult12 = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Dyson Sphere',
        ['text'] = {
            [1] = 'Apply all {C:rare}Rare{} Joker effects',
            [2] = 'with the same theme as this card',
            [3] = 'on Vanilla hands only'
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Pair"]) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Duo!"
                }
            end
            if next(context.poker_hands["Three of a Kind"]) then
                return {
                    Xmult = card.ability.extra.Xmult2,
                    message = "Trio!"
                }
            end
            if next(context.poker_hands["Straight"]) then
                return {
                    Xmult = card.ability.extra.Xmult3,
                    message = "Order!"
                }
            end
            if next(context.poker_hands["Flush"]) then
                return {
                    Xmult = card.ability.extra.Xmult4,
                    message = "Tribe!"
                }
            end
            if next(context.poker_hands["Four of a Kind"]) then
                return {
                    Xmult = card.ability.extra.Xmult5,
                    message = "Family!"
                }
            end
            if next(context.poker_hands["Full House"]) then
                return {
                    Xmult = card.ability.extra.Xmult6,
                    message = "Home!"
                }
            end
            if next(context.poker_hands["Two Pair"]) then
                return {
                    Xmult = card.ability.extra.Xmult7,
                    message = "Duos!"
                }
            end
            if next(context.poker_hands["Five of a Kind"]) then
                return {
                    Xmult = card.ability.extra.Xmult8,
                    message = "Quintet!"
                }
            end
            if next(context.poker_hands["Straight Flush"]) then
                return {
                    Xmult = card.ability.extra.Xmult9,
                    message = "Nuts!"
                }
            end
            if next(context.poker_hands["Flush Five"]) then
                return {
                    Xmult = card.ability.extra.Xmult10,
                    message = "Swarm!"
                }
            end
            if next(context.poker_hands["Flush House"]) then
                return {
                    Xmult = card.ability.extra.Xmult11,
                    message = "Unity!"
                }
            end
            if next(context.poker_hands["High Card"]) then
                return {
                    Xmult = card.ability.extra.Xmult12,
                    message = "Filler!"
                }
            end
        end
    end
}
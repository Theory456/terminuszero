SMODS.Joker{ --The Dyson Sphere
    key = "thedysonsphere",
    config = {
        extra = {
            Xmult = 2,
            Xmult2 = 6,
            Xmult3 = 3,
            Xmult4 = 2,
            Xmult5 = 24,
            Xmult6 = 52.5,
            Xmult7 = 5,
            Xmult8 = 120,
            Xmult9 = 30,
            Xmult10 = 2160,
            Xmult11 = 945,
            Xmult12 = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Dyson Sphere',
        ['text'] = {
            [1] = 'Apply all {C:rare}Rare{} Joker effects',
            [2] = 'with the same theme as this card',
            [3] = 'on Vanilla hands only'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 5
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
            if context.scoring_name == "Pair" then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Duo!"
                }
            elseif context.scoring_name == "Three of a Kind" then
                return {
                    Xmult = card.ability.extra.Xmult2,
                    message = "Trio!"
                }
            elseif context.scoring_name == "Straight" then
                return {
                    Xmult = card.ability.extra.Xmult3,
                    message = "Order!"
                }
            elseif context.scoring_name == "Flush" then
                return {
                    Xmult = card.ability.extra.Xmult4,
                    message = "Tribe!"
                }
            elseif context.scoring_name == "Four of a Kind" then
                return {
                    Xmult = card.ability.extra.Xmult5,
                    message = "Family!"
                }
            elseif context.scoring_name == "Full House" then
                return {
                    Xmult = card.ability.extra.Xmult6,
                    message = "Home!"
                }
            elseif context.scoring_name == "Two Pair" then
                return {
                    Xmult = card.ability.extra.Xmult7,
                    message = "Duos!"
                }
            elseif context.scoring_name == "Five of a Kind" then
                return {
                    Xmult = card.ability.extra.Xmult8,
                    message = "Quintet!"
                }
            elseif context.scoring_name == "Straight Flush" then
                return {
                    Xmult = card.ability.extra.Xmult9,
                    message = "Nuts!"
                }
            elseif context.scoring_name == "Flush Five" then
                return {
                    Xmult = card.ability.extra.Xmult10,
                    message = "Swarm!"
                }
            elseif context.scoring_name == "Flush House" then
                return {
                    Xmult = card.ability.extra.Xmult11,
                    message = "Unity!"
                }
            elseif context.scoring_name == "High Card" then
                return {
                    Xmult = card.ability.extra.Xmult12,
                    message = "Filler!"
                }
            end
        end
    end
}
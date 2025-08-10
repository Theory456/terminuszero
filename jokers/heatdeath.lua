SMODS.Joker{ --Heat Death
    key = "heatdeath",
    config = {
        extra = {
            jyear = 0,
            currentyear = 0
        }
    },
    loc_txt = {
        ['name'] = 'Heat Death',
        ['text'] = {
            [1] = '{X:enhanced,C:white}^1{} Mult every year away from',
            [2] = 'the {C:attention}Balatro Gameplay Update{} you are in',
            [3] = '{C:inactive}(Currently: {}{X:enhanced,C:white}^#1#{}{C:inactive} Mult){}',
            [4] = '{C:inactive}(Archaeologists found two {}{X:legendary,C:white}Infinite{} {C:inactive}Jokers',
            [5] = '{C:inactive}in what used to be the mod author\'s house.){}'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 25,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jyear}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local jyear_value = card.ability.extra.jyear
                card.ability.extra.jyear = os.date("*t", os.time()).year
                card.ability.extra.jyear = math.max(0, (card.ability.extra.jyear) - 2024)
                return {
                    e_mult = jyear_value
                }
        end
    end
}
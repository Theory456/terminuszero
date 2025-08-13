SMODS.Joker{ --Visually Appealing Joker
    key = "visuallyappealingjoker",
    config = {
        extra = {
            Xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Visually Appealing Joker',
        ['text'] = {
            [1] = 'Scored {C:attention}face cards{} give {X:red,C:white}X10{} Mult',
            [2] = 'and are {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    cost = 25,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                return {
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}
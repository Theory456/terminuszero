SMODS.Joker{ --The Stool
    key = "thestool",
    config = {
        extra = {
            currentyearday = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Stool',
        ['text'] = {
            [1] = 'Played {C:enhanced}Aegean Cards{} add {C:red}Mult{}',
            [2] = 'equal to the {C:attention}current year day{}',
            [3] = '',
            [4] = '{C:inactive}(It\'s day {}{s:1.3}#1#{}{C:inactive} of the year){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {os.date("*t", os.time()).yday}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true then
                return {
                    mult = os.date("*t", os.time()).yday
                }
            end
        end
    end
}
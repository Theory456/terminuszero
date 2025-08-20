SMODS.Joker{ --Neddaslivio
    key = "neddaslivio",
    config = {
        extra = {
            mlt = 1
        }
    },
    loc_txt = {
        ['name'] = 'Neddaslivio',
        ['text'] = {
            [1] = 'This Joker gains a {X:red,C:white}multiplicative{}',
            [2] = '{X:red,C:white}X2{} Mult when a {C:attention}face card{} is destroyed',
            [3] = '{C:inactive}(Currently: {}{X:red,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    cost = 80,
    rarity = "teu_superior",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 5
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mlt}}
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
    for k, removed_card in ipairs(context.removed) do
        if removed_card:is_face() then
            return true
        end
    end
    return false
end)() then
                return {
                    func = function()
                    card.ability.extra.mlt = (card.ability.extra.mlt) * 2
                    return true
                end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.mlt
                }
        end
    end
}
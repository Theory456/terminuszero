SMODS.Joker{ --Joanreneu
    key = "joanreneu",
    config = {
        extra = {
            mlt = 1,
            mult = 4,
            Xmult = 4,
            emult = 1.4
        }
    },
    loc_txt = {
        ['name'] = 'Joanreneu',
        ['text'] = {
            [1] = 'Played Kings and Queens each give',
            [2] = '{C:red}+4{}, {X:red,C:white}X4{} and {X:enhanced,C:white}^1.4{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
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

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 13 or context.other_card:get_id() == 12) then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        Xmult = card.ability.extra.Xmult,
                        extra = {
                            e_mult = card.ability.extra.emult,
                            colour = G.C.DARK_EDITION
                        }
                        }
                }
            end
        end
    end
}
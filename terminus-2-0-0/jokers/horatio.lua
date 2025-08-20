SMODS.Joker{ --Horatio
    key = "horatio",
    config = {
        extra = {
            discard_change = 23,
            mlt = 1,
            discardsremaining = 0
        }
    },
    loc_txt = {
        ['name'] = 'Horatio',
        ['text'] = {
            [1] = '{C:red}+23{} permanent discards',
            [2] = 'This Joker gives {X:red,C:white}X1{} Mult for every',
            [3] = '{C:red}discard{} you have left'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
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
        x = 8,
        y = 4
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
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = G.GAME.current_round.discards_left
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_change
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_change
    end
}
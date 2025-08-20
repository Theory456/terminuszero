SMODS.Joker{ --Anglerais
    key = "anglerais",
    config = {
        extra = {
            hand_change = 4,
            discard_change = 4,
            mlt = 1,
            xchips = 4,
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Anglerais',
        ['text'] = {
            [1] = 'Disable all {C:attention}Boss Blinds{}',
            [2] = '{X:red,C:white}X4{} Mult and {X:blue,C:white}X4{} Chips',
            [3] = '{C:red}+4{} hands and {C:blue}+4{} discards',
            [4] = '{C:attention}+4{} hand size',
            [5] = '{C:attention}+4{} Joker Slots',
            [6] = '{C:attention}+4{} Card Selection Limit'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
        x = 3,
        y = 0
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
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
        
    if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
        G.GAME.blind:disable()
        play_sound('timpani')
        SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
    end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_change
        G.hand:change_size(4)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 4
        
  if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
      G.GAME.blind:disable()
      play_sound('timpani')
      SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
  end
  
        SMODS.change_play_limit(4)
        SMODS.change_discard_limit(4)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_change
        G.hand:change_size(-4)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 4
        SMODS.change_play_limit(-4)
        SMODS.change_discard_limit(-4)
    end
}
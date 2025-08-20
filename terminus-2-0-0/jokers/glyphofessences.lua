SMODS.Joker{ --Glyph of Essences
    key = "glyphofessences",
    config = {
        extra = {
            repetitions = 25
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Essences',
        ['text'] = {
            [1] = 'Retrigger the {C:attention}first{} and',
            [2] = '{C:attention}last{} played cards {C:attention,s:1.2}25{} times',
            [3] = '{C:inactive}(Can only appear from {}{C:spectral}The Wraith{}{C:inactive}){}',
            [4] = '{C:inactive}(Hey, I\'ve seen this before!){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 3
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' 
          or args.source == 'rif' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand]) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}
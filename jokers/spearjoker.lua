SMODS.Joker{ --Spear Joker
    key = "spearjoker",
    config = {
        extra = {
            odds = 9,
            Xmult = 9
        }
    },
    loc_txt = {
        ['name'] = 'Spear Joker',
        ['text'] = {
            [1] = 'Played 9s have a {C:green}#1# in #2#{}',
            [2] = 'chance to give {X:red,C:white}X9{} Mult',
            [3] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_spearjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                if SMODS.pseudorandom_probability(card, 'group_0_4c8901df', 1, card.ability.extra.odds, 'j_terminus_spearjoker') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 3)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 3
    end
}
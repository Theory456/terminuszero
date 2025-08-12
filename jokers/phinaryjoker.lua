SMODS.Joker{ --Phinary Joker
    key = "phinaryjoker",
    config = {
        extra = {
            kft2 = 18
        }
    },
    loc_txt = {
        ['name'] = 'Phinary Joker',
        ['text'] = {
            [1] = '{C:blue}+18{} Chips, a rank oscilating between',
            [2] = 'Ace, 2, 3, 5 and 8 determines the',
            [3] = 'next card scored in order to',
            [4] = 'scale this Joker by an extra {C:blue}+10{}',
            [5] = '{C:inactive}(Currently: #1# and {C:blue}+#2# {}{C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.kft2, localize((G.GAME.current_round.jrank_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.jrank_card = { rank = 'Ace', id = 14 }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == G.GAME.current_round.jrank_card.id and context.other_card:get_id() == 14) then
                G.GAME.current_round.jrank_card.rank = '2'
                    G.GAME.current_round.jrank_card.id = 2
                card.ability.extra.kft2 = (card.ability.extra.kft2) + 10
            elseif (context.other_card:get_id() == G.GAME.current_round.jrank_card.id and context.other_card:get_id() == 8) then
                G.GAME.current_round.jrank_card.rank = 'A'
                    G.GAME.current_round.jrank_card.id = 14
                card.ability.extra.kft2 = (card.ability.extra.kft2) + 10
            elseif (context.other_card:get_id() == G.GAME.current_round.jrank_card.id and context.other_card:get_id() == 2) then
                G.GAME.current_round.jrank_card.rank = '3'
                    G.GAME.current_round.jrank_card.id = 3
                card.ability.extra.kft2 = (card.ability.extra.kft2) + 10
            elseif (context.other_card:get_id() == G.GAME.current_round.jrank_card.id and context.other_card:get_id() == 3) then
                G.GAME.current_round.jrank_card.rank = '5'
                    G.GAME.current_round.jrank_card.id = 5
                card.ability.extra.kft2 = (card.ability.extra.kft2) + 10
            elseif (context.other_card:get_id() == G.GAME.current_round.jrank_card.id and context.other_card:get_id() == 5) then
                G.GAME.current_round.jrank_card.rank = '8'
                    G.GAME.current_round.jrank_card.id = 8
                card.ability.extra.kft2 = (card.ability.extra.kft2) + 10
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.kft2
                }
        end
    end
}
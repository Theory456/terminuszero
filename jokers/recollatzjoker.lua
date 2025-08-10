SMODS.Joker{ --Recollatz Joker
    key = "recollatzjoker",
    config = {
        extra = {
            Xmult = 3,
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Recollatz Joker',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult and {C:red}+1{} Mult when a card of',
            [2] = 'a random rank is played, reroll when triggered',
            [3] = '{C:inactive}(Currently: #1#){}'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {localize((G.GAME.current_round.jrank_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.jrank_card = { rank = 'Ace', id = 14 }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == G.GAME.current_round.jrank_card.id then
                if G.playing_cards then
                        local valid_jrank_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_jrank_cards[#valid_jrank_cards + 1] = v
                            end
                        end
                        if valid_jrank_cards[1] then
                            local jrank_card = pseudorandom_element(valid_jrank_cards, pseudoseed('jrank' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.jrank_card.rank = jrank_card.base.value
                            G.GAME.current_round.jrank_card.id = jrank_card.base.id
                        end
                    end
                return {
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
            end
        end
    end
}
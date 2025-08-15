SMODS.Joker{ --The Miracle
    key = "themiracle",
    config = {
        extra = {
            echips = 1.4,
            odds = 7,
            joker_slots = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Miracle',
        ['text'] = {
            [1] = 'Scored {C:enhanced}Aegean Cards{} give {X:enhanced,C:white}^1.4{} Mult',
            [2] = 'and have a {C:uncommon}#1# in #2#{} chance of giving',
            [3] = '{C:attention}+1{} Joker Slot if a {C:attention}Jolly Joker{} is owned'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 2
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_terminus_themiracle') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_terminus_aegean"] == true and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_jolly_joker" then
              return true
          end
      end
      return false
  end)()) then
                return {
                    e_chips = card.ability.extra.echips
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_7a11fb98', 1, card.ability.extra.odds, 'j_terminus_themiracle') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.joker_slots).." Joker Slot", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
                return true
            end}, card)
                  end
                        return true
                    end
                }
            end
        end
    end
}
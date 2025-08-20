SMODS.Joker{ --Glyph of Balance
    key = "glyphofbalance",
    config = {
        extra = {
            mlt = 1,
            chs = 1,
            echips = 1.1,
            emult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Glyph of Balance',
        ['text'] = {
            [1] = '{X:blue,C:white}X1{} Chips and {X:red,C:white}X1{} Mult',
            [2] = '{X:enhanced,C:white}^1.1{} Chips and Mult',
            [3] = 'Playing a hand causes {X:red,C:white}X0.1{} Mult',
            [4] = 'to flow from {X:red,C:white}XMult{} to {X:blue,C:white}XChips{}',
            [5] = 'Discarding a hand causes {X:blue,C:white}X0.1{} Chips',
            [6] = 'to flow from {X:blue,C:white}XChips{} to {X:red,C:white}XMult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        x = 2,
        y = 3
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local chs_value = card.ability.extra.chs
                local mlt_value = card.ability.extra.mlt
                card.ability.extra.chs = (card.ability.extra.chs) + 0.1
                card.ability.extra.mlt = math.max(0, (card.ability.extra.mlt) - 0.1)
                return {
                    x_chips = chs_value,
                    extra = {
                        Xmult = mlt_value,
                        extra = {
                            e_chips = card.ability.extra.echips,
                            colour = G.C.DARK_EDITION,
                        extra = {
                            e_mult = card.ability.extra.emult,
                            colour = G.C.DARK_EDITION
                        }
                        }
                        }
                }
        end
        if context.pre_discard  then
                return {
                    func = function()
                    card.ability.extra.chs = math.max(0, (card.ability.extra.chs) - 0.1)
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.mlt = (card.ability.extra.mlt) + 0.1
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
        end
    end
}
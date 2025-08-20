SMODS.Rarity {
    key = "superior",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('4a61e2'),
    loc_txt = {
        name = "Superior"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
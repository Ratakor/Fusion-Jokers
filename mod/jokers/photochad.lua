SMODS.Atlas {
    key = 'j_photochad',
    path = "j_photochad.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "photochad",
    atlas = 'j_photochad',
    pos = { x = 0, y = 0 },
    rarity = "fuse_fusion",
    cost = 10,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 2,
            repetitions = 2,
            joker1 = "j_photograph",
            joker2 = "j_hanging_chad"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.repetitions,
                localize { type = 'name_text', key = card.ability.extra.joker1, set = 'Joker' },
                localize { type = 'name_text', key = card.ability.extra.joker2, set = 'Joker' }
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
            if context.repetition then
                return {
                    repetitions = card.ability.extra.repetitions,
                }
            end

            if context.individual then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
    end,
}

-- See localization/en-us.lua to create joker text

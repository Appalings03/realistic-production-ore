-- globals.lua
-- Central list of ore-like objects to generate for the realistic_production_ore mod.
-- Add or edit entries here; the util builder will use these to create items, recipes,
-- technologies and resource entities automatically.

local geological_sources = {

    -- 1. Surface crust rocks (major elements)
    { name = "crustal_rock_deposit",        tier = 1 },

    -- 2. Igneous intrusive / plutonic bodies
    { name = "igneous_intrusion",           tier = 2 },

    -- 3. Mantle-derived ultramafic pipes
    { name = "mantle_pipe",                 tier = 3 },

    -- 4. Hydrothermal vein systems
    { name = "hydrothermal_vein",           tier = 2 },

    -- 5. Sedimentary evaporite basins
    { name = "evaporite_basin",             tier = 1 },

    -- 6. Brine & seawater reservoirs
    { name = "brine_reservoir",             tier = 2 },

    -- 7. Atmospheric gas field
    { name = "atmospheric_field",           tier = 1 },

    -- 8. Impact structure deposits (rare metals)
    { name = "impact_structure",            tier = 4 },

    -- 9. Radioactive mineral zone
    { name = "radioactive_zone",            tier = 4 }

}

local artificial_elements = {

    -- Technetium
    { name = "technetium", symbol = "Tc", atomic = 43 },

    -- Promethium
    { name = "promethium", symbol = "Pm", atomic = 61 },

    -- Transuranium elements
    { name = "neptunium",  symbol = "Np", atomic = 93 },
    { name = "plutonium",  symbol = "Pu", atomic = 94 },
    { name = "americium",  symbol = "Am", atomic = 95 },
    { name = "curium",     symbol = "Cm", atomic = 96 },
    { name = "berkelium",  symbol = "Bk", atomic = 97 },
    { name = "californium",symbol = "Cf", atomic = 98 },
    { name = "einsteinium",symbol = "Es", atomic = 99 },
    { name = "fermium",    symbol = "Fm", atomic = 100 },
    { name = "mendelevium",symbol = "Md", atomic = 101 },
    { name = "nobelium",   symbol = "No", atomic = 102 },
    { name = "lawrencium", symbol = "Lr", atomic = 103 },

    -- Superheavy synthetic elements
    { name = "rutherfordium", symbol = "Rf", atomic = 104 },
    { name = "dubnium",       symbol = "Db", atomic = 105 },
    { name = "seaborgium",    symbol = "Sg", atomic = 106 },
    { name = "bohrium",       symbol = "Bh", atomic = 107 },
    { name = "hassium",       symbol = "Hs", atomic = 108 },
    { name = "meitnerium",    symbol = "Mt", atomic = 109 },
    { name = "darmstadtium",  symbol = "Ds", atomic = 110 },
    { name = "roentgenium",   symbol = "Rg", atomic = 111 },
    { name = "copernicium",   symbol = "Cn", atomic = 112 },
    { name = "nihonium",      symbol = "Nh", atomic = 113 },
    { name = "flerovium",     symbol = "Fl", atomic = 114 },
    { name = "moscovium",     symbol = "Mc", atomic = 115 },
    { name = "livermorium",   symbol = "Lv", atomic = 116 },
    { name = "tennessine",    symbol = "Ts", atomic = 117 },
    { name = "oganesson",     symbol = "Og", atomic = 118 }

}
-- 1️ Crustal rocks: granite, basalt, shale, limestone
local crustal_rock_deposit = {
    { name = "oxygen",       symbol = "O",  atomic = 8 },
    { name = "silicon",      symbol = "Si", atomic = 14 },
    { name = "aluminum",     symbol = "Al", atomic = 13 },
    { name = "iron",         symbol = "Fe", atomic = 26 },
    { name = "calcium",      symbol = "Ca", atomic = 20 },
    { name = "sodium",       symbol = "Na", atomic = 11 },
    { name = "potassium",    symbol = "K",  atomic = 19 },
    { name = "magnesium",    symbol = "Mg", atomic = 12 },
    { name = "titanium",     symbol = "Ti", atomic = 22 },
    { name = "manganese",    symbol = "Mn", atomic = 25 }
}

-- 2️ Igneous intrusive / plutonic bodies: gabbro, diorite, syenite
local igneous_intrusion = {
    { name = "copper",       symbol = "Cu", atomic = 29 },
    { name = "molybdenum",   symbol = "Mo", atomic = 42 },
    { name = "tin",          symbol = "Sn", atomic = 50 },
    { name = "tungsten",     symbol = "W",  atomic = 74 },
    { name = "cerium",       symbol = "Ce", atomic = 58 },
    { name = "neodymium",    symbol = "Nd", atomic = 60 },
    { name = "lanthanum",    symbol = "La", atomic = 57 }
}

-- 3️ Mantle-derived ultramafic pipes: kimberlite, peridotite
local mantle_pipe = {
    { name = "nickel",       symbol = "Ni", atomic = 28 },
    { name = "cobalt",       symbol = "Co", atomic = 27 },
    { name = "chromium",     symbol = "Cr", atomic = 24 },
    { name = "platinum",     symbol = "Pt", atomic = 78 },
    { name = "palladium",    symbol = "Pd", atomic = 46 },
    { name = "iridium",      symbol = "Ir", atomic = 77 },
    { name = "rhodium",      symbol = "Rh", atomic = 45 },
    { name = "osmium",       symbol = "Os", atomic = 76 },
    { name = "ruthenium",    symbol = "Ru", atomic = 44 },
    { name = "diamond",      symbol = "C",  atomic = 6 } -- gameplay
}

-- 4️ Hydrothermal vein systems
local hydrothermal_vein = {
    { name = "copper",       symbol = "Cu", atomic = 29 },
    { name = "zinc",         symbol = "Zn", atomic = 30 },
    { name = "lead",         symbol = "Pb", atomic = 82 },
    { name = "silver",       symbol = "Ag", atomic = 47 },
    { name = "gold",         symbol = "Au", atomic = 79 },
    { name = "antimony",     symbol = "Sb", atomic = 51 },
    { name = "mercury",      symbol = "Hg", atomic = 80 }
}

-- 5️ Evaporite basins
local evaporite_basin = {
    { name = "sodium",       symbol = "Na", atomic = 11 },
    { name = "potassium",    symbol = "K",  atomic = 19 },
    { name = "magnesium",    symbol = "Mg", atomic = 12 },
    { name = "chlorine",     symbol = "Cl", atomic = 17 },
    { name = "bromine",      symbol = "Br", atomic = 35 },
    { name = "lithium",      symbol = "Li", atomic = 3 },
    { name = "boron",        symbol = "B",  atomic = 5 },
    { name = "strontium",    symbol = "Sr", atomic = 38 }
}

-- 6️ Brine & seawater reservoirs
local brine_reservoir = {
    { name = "lithium",      symbol = "Li", atomic = 3 },
    { name = "magnesium",    symbol = "Mg", atomic = 12 },
    { name = "bromine",      symbol = "Br", atomic = 35 },
    { name = "iodine",       symbol = "I",  atomic = 53 },
    { name = "strontium",    symbol = "Sr", atomic = 38 }
}

-- 7️ Atmospheric gas field
local atmospheric_field = {
    { name = "nitrogen",     symbol = "N",  atomic = 7 },
    { name = "oxygen",       symbol = "O",  atomic = 8 },
    { name = "argon",        symbol = "Ar", atomic = 18 },
    { name = "neon",         symbol = "Ne", atomic = 10 },
    { name = "krypton",      symbol = "Kr", atomic = 36 },
    { name = "xenon",        symbol = "Xe", atomic = 54 }
}

-- 8️ Impact structure deposits
local impact_structure = {
    { name = "iridium",      symbol = "Ir", atomic = 77 },
    { name = "platinum",     symbol = "Pt", atomic = 78 },
    { name = "nickel",       symbol = "Ni", atomic = 28 },
    { name = "cobalt",       symbol = "Co", atomic = 27 }
}

-- 9️ Radioactive mineral zone
local radioactive_zone = {
    { name = "uranium",      symbol = "U",  atomic = 92 },
    { name = "thorium",      symbol = "Th", atomic = 90 },
    { name = "radium",       symbol = "Ra", atomic = 88 }
}


-- Missing elements
local gas_elements = {
	{name = "hydrogen", symbol = "H", atomic = 1},
	{ name = "helium",    symbol = "He", atomic = 2 },
    { name = "fluorine",  symbol = "F",  atomic = 9 },
    { name = "radon",     symbol = "Rn", atomic = 86 }
}

local alkaline = {
    { name = "beryllium", symbol = "Be", atomic = 4 },
    { name = "vanadium",  symbol = "V",  atomic = 23 },
    { name = "niobium",   symbol = "Nb", atomic = 41 },
    { name = "tantalum",  symbol = "Ta", atomic = 73 },
    { name = "hafnium",   symbol = "Hf", atomic = 72 },
    { name = "zirconium", symbol = "Zr", atomic = 40 }
}

local lanthanides = {
    { name = "praseodymium", symbol = "Pr", atomic = 59 },
    { name = "samarium",      symbol = "Sm", atomic = 62 },
    { name = "europium",      symbol = "Eu", atomic = 63 },
    { name = "gadolinium",    symbol = "Gd", atomic = 64 },
    { name = "terbium",       symbol = "Tb", atomic = 65 },
    { name = "dysprosium",    symbol = "Dy", atomic = 66 },
    { name = "holmium",       symbol = "Ho", atomic = 67 },
    { name = "erbium",        symbol = "Er", atomic = 68 },
    { name = "thulium",       symbol = "Tm", atomic = 69 },
    { name = "ytterbium",     symbol = "Yb", atomic = 70 },
    { name = "lutetium",      symbol = "Lu", atomic = 71 }
}

local metalloids = {
    { name = "germanium", symbol = "Ge", atomic = 32 },
    { name = "arsenic",   symbol = "As", atomic = 33 },
    { name = "selenium",  symbol = "Se", atomic = 34 },
    { name = "tellurium", symbol = "Te", atomic = 52 },
    { name = "bismuth",   symbol = "Bi", atomic = 83 }
}

return {geological_sources, artificial_elements,
	   crustal_rock_deposit, igneous_intrusion, mantle_pipe, hydrothermal_vein,
	   evaporite_basin, brine_reservoir, atmospheric_field, impact_structure, radioactive_zone, gas_elements,metalloids, alkaline, lanthanides}
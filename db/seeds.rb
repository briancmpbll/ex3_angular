physical  = AttributeCategory.create(name: 'Physical')
social    = AttributeCategory.create(name: 'Social')
mental    = AttributeCategory.create(name: 'Mental')

Attribute.create(
  [
    { name: 'Strength',      attribute_category: physical },
    { name: 'Dexterity',     attribute_category: physical },
    { name: 'Stamina',       attribute_category: physical },
    { name: 'Charisma',      attribute_category: social },
    { name: 'Manipulation',  attribute_category: social },
    { name: 'Appearance',    attribute_category: social },
    { name: 'Perception',    attribute_category: mental },
    { name: 'Intelligence',  attribute_category: mental },
    { name: 'Wits',          attribute_category: mental }
  ])

archery       = Ability.create(name: 'Archery')
athletics     = Ability.create(name: 'Athletics')
awareness     = Ability.create(name: 'Awareness')
brawl         = Ability.create(name: 'Brawl')
bureacracy    = Ability.create(name: 'Bureacracy')
craft         = Ability.create(name: 'Craft')
dodge         = Ability.create(name: 'Dodge')
integrity     = Ability.create(name: 'Integrity')
investigation = Ability.create(name: 'Investigation')
larceny       = Ability.create(name: 'Larceny')
linguistics   = Ability.create(name: 'Linguistics')
lore          = Ability.create(name: 'Lore')
martial_arts  = Ability.create(name: 'Martial Arts')
medicine      = Ability.create(name: 'Medicine')
melee         = Ability.create(name: 'Melee')
occult        = Ability.create(name: 'Occult')
performance   = Ability.create(name: 'Performance')
presence      = Ability.create(name: 'Presence')
resistence    = Ability.create(name: 'Resistence')
ride          = Ability.create(name: 'Ride')
sail          = Ability.create(name: 'Sail')
socialize     = Ability.create(name: 'Socialize')
stealth       = Ability.create(name: 'Stealth')
survival      = Ability.create(name: 'Survival')
thrown        = Ability.create(name: 'Thrown')
war           = Ability.create(name: 'War')

solar = CharacterType.create(name: 'Solar Exalt')

dawn = Caste.create(
  name: 'Dawn Caste',
  character_type: solar,
  abilities: [archery, awareness, brawl, martial_arts, dodge, melee, resistence, thrown, war])
zenith = Caste.create(
  name: 'Zenith Caste',
  character_type: solar,
  abilities: [athletics, integrity, performance, lore, presence, resistence, survival, war])
twilight = Caste.create(
  name: 'Twilight Caste',
  character_type: solar,
  abilities: [bureacracy, craft, integrity, investigation, linguistics, lore, medicine, occult])
night = Caste.create(
  name: 'Night Caste',
  character_type: solar,
  abilities: [athletics, awareness, dodge, investigation, larceny, ride, stealth, socialize])
eclipse = Caste.create(
  name: 'Eclipse Caste',
  character_type: solar,
  abilities: [bureacracy, larceny, linguistics, occult, presence, ride, sail, socialize])

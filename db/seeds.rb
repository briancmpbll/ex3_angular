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
  abilities: [archery, awareness, brawl, martial_arts, dodge, melee, resistence,
              thrown, war])
zenith = Caste.create(
  name: 'Zenith Caste',
  character_type: solar,
  abilities: [athletics, integrity, performance, lore, presence, resistence,
              survival, war])
twilight = Caste.create(
  name: 'Twilight Caste',
  character_type: solar,
  abilities: [bureacracy, craft, integrity, investigation, linguistics, lore,
              medicine, occult])
night = Caste.create(
  name: 'Night Caste',
  character_type: solar,
  abilities: [athletics, awareness, dodge, investigation, larceny, ride,
              stealth, socialize])
eclipse = Caste.create(
  name: 'Eclipse Caste',
  character_type: solar,
  abilities: [bureacracy, larceny, linguistics, occult, presence, ride, sail,
              socialize])

AnimaEffect.create(
  [
    { owner: solar,
      condition: 'Spend 1 mote of Essence',
      effect: 'Know the exact time of day, even underground or in the Wyld.' },
    { owner: solar,
      condition: 'Spend 1 mote of Essence',
      effect: 'Display Caste mark for as long as desired.' },
    { owner: dawn,
      condition: 'Bonfine/iconic anima display',
      effect: 'Add half Essence (round up) to base Initiative upon resetting to
              base after a successful decisive attack.' },
    { owner: dawn,
      condition: 'Spend 10 motes of Essence',
      effect: 'Reset all combat and movement Charms with outstanding reset
              conditions. May be used once per day, resetting at sunrise.' },
    { owner: dawn,
      condition: 'Passive',
      effect: 'Add half Essence (round up) dice to intimidate rolls. May also
              intimidate targets which do not feel fear.' },
    { owner: zenith,
      condition: 'Spend 1 mote of Essence and touch a corpse',
      effect: 'Ensures the soul of the deceased will not become a hungry ghost.
              May also perceive the strongest Intimacies of the deceased and may
              choose to accept them. Afterwards, may pay one mote and touch a
              target of those Intimacies to pass on feelings of peace, love, and
              assurance, shedding them in the process. May also transfer them to
              an object, allowing it to convey comfort or a sense of duty to the
              subject. May touch someone who caused the deceased to suffer, pay
              one mote and roll ([A social Attribute] + Presence) with three
              automatic non-Charm successes against their Resolve to transfer
              pain suffered by the deceased back on the one who caused it. The
              Storyteller is free to dictate the length and weight of such
              attrition.' },
    { owner: zenith,
      condition: 'Spend 10 motes of Essence and 1 Willpower',
      effect: 'Supplements a successful decisive attack against a creature of
              darkness. Prevents Initiative from returning to base value after
              the attack. Costs five motes and zero Willpower when anima is at
              bonfire. May be used once per day, resetting at noon.'
    },
    { owner: zenith,
      condition: 'Spend 7 motes of Essence',
      effect: 'Order a dematerialized spirit to manifest using a (Charisma +
              Presence) persuade action with (Essence) automatic successes.
              Spirit is compelled as if by a Defining Intimacy, but may still
              have Defining Ties or Principles which counter this advantage. If
              successful, the spirit does not need to pay the cost to
              materialize.'
    },
    { owner: twilight,
      condition: 'Spend 5 motes of Essence',
      effect: 'Reflexively gains five Hardness for one turn. Automatic and free
              at the bonfire/iconic level. Does not stack with other magic that
              raises Hardness, but can be used during Initiative Crash.'
    },
    { owner: twilight,
      condition: 'Spend 10 motes of Essence and 1 Willpower',
      effect: 'Disappear into anima over one turn. Fails if character moves or
              suffers knockdown before the action is completed. Reappears upon
              the next sunset at a place of power within 10 miles of vanishing
              point, chosen by Storyteller'
    },
    { owner: twilight,
      condition: 'Spend 10 motes',
      effect: 'Touch an Essence 1-3 elemental or a demon of the first circle.
              Roll Intelligence + Occult against the creature’s Resolve. If
              successful, target becomes a familiar. Can reflexivey summon the
              target instantly for three motes. May banish the creature
              reflexively for free, returning it to the tides of Essence that
              suffuse Creation. May have up to (Essence) spirit familiars bound
              at once.'
    },
    { owner: night,
      condition: 'Spend 2 motes',
      effect: 'Treat all Peripheral Essence expenditures as Personal for one
              instant.'
    },
    { owner: night,
      condition: 'Spend 3 motes',
      effect: 'Ignore up to (higher of 3 or Essence) penalties to a Stealth
              attempt for one instant. These motes are always considered
              Personal.'
    },
    { owner: night,
      condition: 'Bonfire/iconic anima display',
      effect: 'Anima hides indentity. This is a perfect effect.'
    },
    { owner: eclipse,
      condition: 'Spend 10 motes and 1 Willpower',
      effect: 'Sanctifies a witnessed oath. Oath-givers who break sanctified
              pacts are subject to a curse devised by the Storyteller, ideally
              reflecting the oath broken.'
    },
    { owner: eclipse,
      condition: 'Passive',
      effect: 'Diplomatic immunity when treating with the enemies of Creation
              while on legitimate business. Shades, spirits, the demon princes
              of Hell, and the Fair Folk may not attack the Eclipse or her
              companions without just cause, and such creatures must observe the
              local rules of hospitality.'
    },
    { owner: eclipse,
      condition: 'Passive',
      effect: 'Can learn the Charms of other character types with the Eclipse
              keyword for eight experience points each.'
    }
  ]
)

if %w(development test).include?(Rails.env.downcase)
  Caste.all.each do |caste|
    5.times do
      character = Character.create(
        name: Faker::Name.name,
        concept: 'An awesome character',
        caste: caste,
        willpower: rand(1..10),
        essence: rand(1..5)
      )

      Attribute.all.each do |attribute|
        CharacterAttribute.create(
          character: character,
          attribute_data: attribute,
          value: rand(1..5)
        )
      end

      Ability.all.each do |ability|
        CharacterAbility.create(
          character: character,
          ability: ability,
          value: rand(0..5)
        )
      end
    end
  end
end

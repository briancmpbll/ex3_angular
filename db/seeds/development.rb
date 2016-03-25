Caste.all.each do |caste|
  character = Character.create(
    name: "#{caste.name} Character",
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

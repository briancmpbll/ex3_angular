Caste.all.each do |caste|
  character = Character.create(
    name: 'Test Character',
    concept: 'An awesome character',
    caste: caste,
    willpower: rand(1..10),
    essence: rand(1..5)
  )

  Ability.all.each do |ability|
    CharacterAbility.create(
      character: character,
      ability: ability,
      value: rand(0..5)
    )
  end
end

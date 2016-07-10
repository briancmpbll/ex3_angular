character_abilities.each do |character_ability|
  json.set! character_ability.ability.id do
    json.value character_ability.value
    json.favored character_ability.favored

    unless character_ability.specialties.empty?
      json.specialties character_ability.specialties.collect(&:description)
    end
  end
end

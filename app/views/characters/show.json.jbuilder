json.partial! 'character', character: @character

json.attributes do
  @character.character_attributes.each do |character_attribute|
    json.set! character_attribute.attribute_data.id, character_attribute.value
  end
end

json.abilities do
  @character.character_abilities.each do |character_ability|
    json.set! character_ability.ability.id do
      json.value character_ability.value
      json.favored character_ability.favored
    end
  end
end

if @character.supernal_ability
  json.supernal_ability @character.supernal_ability.id
end

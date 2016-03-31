json.partial! 'character', character: @character

json.attributes do
  @character.character_attributes.each do |character_attribute|
    json.set! character_attribute.attribute_data.id, character_attribute.value
  end
end

json.abilities do
  @character.character_abilities.each do |character_ability|
    json.set! character_ability.ability.id, character_ability.value
  end
end

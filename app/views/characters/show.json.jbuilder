json.partial! 'character', character: @character

json.attributes do
  json.array! @character.character_attributes do |character_attribute|
    json.name character_attribute.attribute_data.name
    json.value character_attribute.value
  end
end

json.abilities do
  json.array! @character.character_abilities do |character_ability|
    json.name character_ability.ability.name
    json.value character_ability.value
  end
end

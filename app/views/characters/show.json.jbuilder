json.partial! 'character', character: @character

json.attributes do
  @character.character_attributes.each do |character_attribute|
    json.set! character_attribute.attribute_data.id, character_attribute.value
  end
end

json.set! 'abilities' do
  json.partial! 'character_abilities/list',
                character_abilities: @character.character_abilities
end

json.supernal_ability @character.supernal_ability.id if
  @character.supernal_ability

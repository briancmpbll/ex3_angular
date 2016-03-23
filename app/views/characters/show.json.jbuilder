json.partial! 'character', character: @character

json.abilities do
  json.array! @character.character_abilities do |character_ability|
    json.name character_ability.ability.name
    json.value character_ability.value
  end
end

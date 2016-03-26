json.call(character, :id, :name, :concept, :willpower, :essence)

json.icon asset_path("#{character.caste.name.downcase}24.png")

json.total @total

json.characters do
  json.array! @characters, partial: 'character', as: :character
end

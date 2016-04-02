@abilities.each do |ability|
  json.set! ability.id, ability.name
end

RSpec::Matchers.define :have_menu_for do |expected|
  match do |actual|
    actual.find('header nav').has_content? expected.username
  end
end

RSpec::Matchers.define :have_logged_out_menu do
  match do |actual|
    actual.find('header nav').has_content? 'Log In'
  end
end

RSpec::Matchers.define :have_alert do |expected|
  match do |actual|
    actual.has_selector? ".alert-#{expected}"
  end
end

RSpec::Matchers.define :be_index_path do
  match do |actual|
    actual == '/#/index'
  end
end

RSpec::Matchers.define :have_character_links do |expected|
  match do |actual|
    expected.each do |character|
      index_list = actual.find('.index-list')
      link = index_list.find_link(character.name,
                                  href: "#/characters/#{character.id}")
      icon = link.find(:xpath, '../img')
      return false unless
        icon['src'].include?(character.caste.name.downcase) &&
        icon['alt'].include?(character.caste.name)
    end
    true
  end
end

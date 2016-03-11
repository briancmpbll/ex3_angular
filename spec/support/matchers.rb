RSpec::Matchers.define :have_menu_for do |expected|
  match do |actual|
    actual.find('header nav').has_content? expected.username
  end
end

RSpec::Matchers.define :have_logged_out_menu do |expected|
  match do |actual|
    actual.find('header nav').has_content? 'Log In'
  end
end

RSpec::Matchers.define :have_alert do |expected|
  match do |actual|
    actual.has_selector? ".alert-#{expected}"
  end
end

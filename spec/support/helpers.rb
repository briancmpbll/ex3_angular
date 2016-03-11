def login(email, password)
  visit '#/login'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log In'
end

def logout
  click_link '#userDropdown'
  click_on 'Log Out'
end

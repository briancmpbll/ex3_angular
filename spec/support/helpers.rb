def login_as(user)
  visit '#/login'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log In'
end

def logout
  click_link '#userDropdown'
  click_on 'Log Out'
end

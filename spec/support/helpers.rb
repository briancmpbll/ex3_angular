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

def signup_as(user)
  visit '#/signup'
  fill_in 'Email', with: user.email
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  fill_in 'Password Confirmation', with: user.password
  click_button 'Sign Up'
end

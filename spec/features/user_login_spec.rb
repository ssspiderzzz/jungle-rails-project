require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do

  before :each do 
    @user = User.new(
      first_name: 'Spider', 
      last_name: 'Z', 
      email: 'spider@gmail.com', 
      password: '123', 
      password_confirmation: '123'
    )
    @user.save
  end

  scenario "User can login from the login page" do
    visit '/login'

    fill_in 'email', with: 'spider@gmail.com'
    fill_in 'password', with: '123'

    click_button 'Submit'

    sleep 4
    
    expect(page).to have_content 'Welcome, spider@gmail.com!'
  end

end
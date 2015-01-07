require 'rails_helper'

feature 'authorizations' do
  scenario 'Sign up new user with valid credentials' do
    visit root_path
    click_on "Sign Up"
    fill_in :first_name, with: "First"
    fill_in :last_name, with: "Last"
    fill_in :email, with: "email@email.com"
    fill_in :password, with: "Password"
    fill_in :confirmation, with: "Password"
    click_on "Sign up"

    expect(page).to have_content("First Last")

  end


end

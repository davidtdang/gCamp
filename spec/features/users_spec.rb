require 'rails_helper'

feature 'CRUDING users' do
  scenario 'User can create a user' do
    visit users_path
    click_on "New User"
    fill_in :first_name, with: "John"
    fill_in :last_name, with: "Doe"
    fill_in :email, with: "john@doe.com"
    click_on "Create User"

    expect(page).to have_content("John Doe")
    expect(page).to have_content("john@doe.com")
  end

  scenario 'User can edit a user' do
    User.create!(
    first_name: "Jane", last_name: "Dough", email: "jane@dough.com"
    )

    visit users_path
    expect(page).to have_content("Jane Dough")
    expect(page).to have_content("jane@dough.com")
    click_on "Edit"
    fill_in :first_name, with: "Jane"
    fill_in :last_name, with: "Doe"
    fill_in :email, with: "jane@doe.com"
    click_on "Update User"

    expect(page).to have_content("Jane Doe")
    expect(page).to have_content("jane@doe.com")
  end

  scenario "Listing a user on index" do
    User.create!(
    first_name: "Namey", last_name: "Nameson", email: "namey@nameson.com"
    )

    visit users_path
    expect(page).to have_content("Namey Nameson")
    expect(page).to have_content("namey@nameson.com")
  end

  scenario "Listing a user on show page" do
    User.create!(
    first_name: "Bob", last_name: "Loblaw", email: "bob@loblaw.com"
    )

    visit users_path
    click_on "Bob Loblaw"
    expect(page).to have_content("Bob")
    expect(page).to have_content("Loblaw")
    expect(page).to have_content("bob@loblaw.com")
  end

  scenario "Deleting user" do
    User.create!(
    first_name: "Deathy", last_name: "Deatherson", email: "deathy@deatherson.com"
    )

    visit users_path
    expect(page).to have_content("Deathy Deatherson")
    expect(page).to have_content("deathy@deatherson.com")
    click_on "Edit"
    click_on "Delete User"
    expect(page).to have_no_content("Deathy Deatherson")
    expect(page).to have_no_content("deathy@deatherson.com")
    expect(page.current_path).to eq(users_path)
  end

end

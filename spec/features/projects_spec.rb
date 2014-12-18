require 'rails_helper'

feature 'CRUDing projects' do
  scenario 'User can create a project' do
    visit projects_path
    click_on "New Project"
    fill_in :name, with: "Project A"
    click_on "Create Project"

    expect(page).to have_content("Project A")
  end

  scenario 'User can edit a project' do
    Project.create!(
    name: "Jackie Chan"
    )

    visit projects_path
    click_on "Jackie Chan"
    click_on "Edit"
    fill_in :name, with: "Project A Starring Jackie Chan"
    click_on "Update Project"

    expect(page).to have_content("Project A Starring Jackie Chan")
  end

  scenario "Listing a project" do
    Project.create!(
    name: "Bruce Lee"
    )
    visit projects_path

    expect(page).to have_content("Bruce Lee")
  end

  scenario "Listing a project on show page" do
    Project.create!(
    name: "Enter the Dragon"
    )

    visit projects_path
    click_on "Enter the Dragon"

    expect(page).to have_content("Enter the Dragon")
  end

  scenario "Deleting project" do
    Project.create!(
    name: "Return of the Dragon"
    )

    visit projects_path
    click_on "Return of the Dragon"
    click_on "Delete"
    expect(page).to have_no_content("Return of the Dragon")
  end

end

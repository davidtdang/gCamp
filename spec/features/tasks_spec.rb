require 'rails_helper'


feature 'CRUDing tasks' do
  scenario 'User can create a task' do
    visit tasks_path
    click_on "New Task"
    fill_in :description , with: "Job to do"
    fill_in :due_date, with: "01/01/2015"
    click_on "Create Task"

    expect(page).to have_content("Job to do")
  end



  scenario "User can edit a task" do
    Task.create!(
    description: "Job that was created"
    )

    visit tasks_path
    expect(page).to have_content("Job that was created")
    click_on "Edit"
    fill_in :description, with: "Job that was edited"
    check(:completed)
    click_on "Update Task"

    expect(page).to have_content("Job that was edited")
    expect(page).to have_no_content("Job that was created")
    expect(page).to have_content("true")
  end

  scenario "Listing a task" do
    Task.create!(
    description: "Job being listed",
    )
    visit tasks_path
    expect(page).to have_content("Job being listed")
  end

  scenario "Deleting task" do
    Task.create!(
    description: "Job being deleted"
    )

    visit tasks_path
    click_on "Delete"
    expect(page).to have_no_content("Job being deleted")
    expect(page.current_path).to eq(tasks_path)
  end

end

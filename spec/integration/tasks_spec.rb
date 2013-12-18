require "spec_helper"

feature "Tasks" do
  
  let(:user) { create :user }
  before(:each) do
    Capybara.current_driver = :selenium
    login
    expect(page).to have_content "Things I Should Do"
  end
  scenario "create a new task" do
    first("input").set("Some crazy task")
    click_on "Add"
    expect(page.first("#tasks")).to have_content "Some crazy task"
  end
  
  scenario "edit existing" do
    add_task("Edit me")
    first(".edit-task").click
    first("#tasks input").set("Edited task\n")
    expect(page.first("#tasks h3")).to have_content "Edited task"
  end
  scenario "complete existing" do
    add_task("Finish me")
    first(".complete-task").click
    expect(page.first("#completed")).to have_content "Finish me"
  end
  scenario "change priority" do
    add_task("Medium priority")
    expect(page.first(".set-medium-priority.active")).to_not be nil
    first(".set-high-priority").click
    expect(page.first(".set-medum-priority.active")).to be nil
    expect(page.first(".set-high-priority.active")).to_not be nil
  end
  scenario "delete task when no title entered" do
    add_task("Erase me")
    first(".edit-task").click
    first("#tasks input").set("")
    click_on "Save"
    expect(page.all("#tasks li")).to have(0).items
  end
  

end


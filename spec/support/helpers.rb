def login
  visit root_path
  fill_in "email", with: user.email
  fill_in "password", with: user.password
  click_on "Login"
end
def register_page
  visit root_path
  click_on "Register Now"
end

def add_task(title="Some crazy task")
  first("input").set(title)
  click_on "Add"
  expect(page.first("#tasks")).to have_content title
end
Given("the following todos exist:") do |table|
  table.hashes.each do |attributes|
    Todo.create!(attributes)
  end
end

When("I visit the todos page") do
  visit todos_path
end

When("I filter by category {string}") do |category|
  select category, from: "category"
  click_button "Filter"
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end

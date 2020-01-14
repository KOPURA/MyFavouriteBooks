Given("the following books exist:") do |table|
  table.hashes.each do |book|
    Book.create! book
  end
end

# When("I go to the edit page for {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# When("I fill in {string} with {string}") do |string, string2|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# When("I press {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

Then("the author of {string} should be {string}") do |string, string2|
  assert Book.where(title: string)[0].author == string2
end

# Given("I am on the details page for {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# When("I follow {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then("I should be on the Similar Books page for {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then("I should see {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then("I should not see {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then("I should be on the home page") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
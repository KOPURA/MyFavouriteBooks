Given("the following books exist:") do |table|
  table.hashes.each do |book|
    Book.create! book
  end
end

Then("the author of {string} should be {string}") do |string, string2|
  assert Book.where(title: string)[0].author == string2
end

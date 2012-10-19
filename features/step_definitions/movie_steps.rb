# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    m = Movie.new
    m.title = movie["title"]
    m.rating = movie["rating"]
    m.release_date = movie["release_date"]
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(',')
  if uncheck 
    ratings.each do |rating|
      uncheck("ratings_#{rating}")
    end
  else
    ratings.each do |rating|
      check("ratings_#{rating}")
    end
  end
end

Given /^I submit the search form on the homepage$/ do
  click_button "ratings_submit"
end

Then /^I should see movies with the folowing ratings: (.*)$/ do
  ratings = ratings_list.split(',')
end

Then /^I should not see movies with the following ratings: PG\-(\d+),G$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end



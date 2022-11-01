require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within (.*[^:])$/ do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that user to the database here.
    User.create(user)
  end
end

Then(/^(\d+) seed users should exist$/) do |n_seeds|
  expect(User.count).to eq n_seeds.to_i
end

Given(/^I am on home page$/) do
  visit root_path
end


When(/^I fill in "([^"]*)" with "([^"]*)" and "([^"]*)" with "([^"]*)"$/) do |field1, value1, field2, value2|
  fill_in(field1,:with => value1)
  fill_in(field2,:with => value2)
end

And(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should be on "([^"]*)"$/) do |page_name|
  current_path = URI.parse(current_url).path
  assert_equal path_to(page_name), current_path
end

Then(/^"([^"]*)" with password "([^"]*)" should not login$/) do |username, password|
  user = User.find_by(username: username, password: password)
  expect(user).to be_nil
end


Given(/^I am on User Input page$/) do
  visit user_input_path
end

And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then(/^I should see all the information of "([^"]*)"$/) do |username|
  user = User.find_by(username: username)
  step %{I should see "#{User.height}"}
  step %{I should see "#{User.weight}"}
  step %{I should see "#{User.sex}"}
  step %{I should see "#{User.age}"}
end



Given(/^I am on the main page of "([^"]*)"$/) do |arg|
  pending
end

Then(/^I should be on the edit page$/) do
  pending
end

Then(/^I should see "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  pending
end

Then(/^I should be on the CalorieManager home page$/) do
  pending
end

And(/^I Press "([^"]*)"$/) do |arg|
  pending
end

Then(/^I should be on the register page$/) do
  pending
end
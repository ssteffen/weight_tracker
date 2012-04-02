Given /^I have no data$/ do
  Weight.count.should eql(0)
  Mood.count.should eql(0)
end

Given /^I have an existing weight less than 24 hours ago$/ do
  FactoryGirl.create(:quick_weight)
end

Given /^I have an existing weight greater than 24 hours ago$/ do
  FactoryGirl.create(:old_weight)
end

Given /^I have an existing mood$/ do
  FactoryGirl.create(:old_mood)
end

When /^I go to the homepage$/ do
  visit '/'
end

When /^I enter a weight of (.+)$/ do |weight|
  page.first('.weight').fill_in('weight_field', :with => weight)
  page.all('.weight button').last.click
end

When /^I enter a mood$/ do
  page.all('.mood button').last.click
end

Then /^I should see the weight input page$/ do
  page.first('.weight').should be_visible
end

Then /^I should see the mood input page$/ do
  page.first('.mood').should be_visible
end

Then /^I should see the main page$/ do
  page.first('.mood_link').should be_visible
  page.first('.weight_link').should be_visible
end

Then /^last updated (.+) should be around 0$/ do |c|
  page.first(".#{c}_link").first('span').text.should eql "0 seconds ago"
end

Then /^last updated (.+) should not be around 0$/ do |c|
  page.first(".#{c}_link").first('span').text.should_not eql "0 seconds ago"
end

Given /^I have no links$/ do
  Link.delete_all
end

Given /^I (only )?have links titled "?([^\"]*)"?$/ do |only, titles|
  Link.delete_all if only
  titles.split(', ').each do |title|
    Link.create(:title => title)
  end
end

Then /^I should have ([0-9]+) links?$/ do |count|
  Link.count.should == count.to_i
end

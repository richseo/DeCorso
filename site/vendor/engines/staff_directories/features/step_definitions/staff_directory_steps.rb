Given /^I have no staff_directories$/ do
  StaffDirectory.delete_all
end

Given /^I (only )?have staff_directories titled "?([^\"]*)"?$/ do |only, titles|
  StaffDirectory.delete_all if only
  titles.split(', ').each do |title|
    StaffDirectory.create(:name => title)
  end
end

Then /^I should have ([0-9]+) staff_director[y|ies]+?$/ do |count|
  StaffDirectory.count.should == count.to_i
end

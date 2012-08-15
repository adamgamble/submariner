Given /^I hit the root address without a subdomain$/ do
  visit "http://example.com/"
end

Then /^I should see "(.*?)"$/ do |words|
  page.should have_content(words)
end

Given /^I setup the submariner gem$/ do
  Submariner::WildCardSubdomain.config do |config|
    config.subdomains_to_ignore = ["www"]
    config.subdomain_block = lambda { |subdomain| $subdomain = subdomain }
  end
end

Given /^I hit the root address with subdomain of "(.*?)"$/ do |subdomain|
  $subdomain = ""
  visit "http://#{subdomain}.example.com/"
end

Then /^the subdomain should be set to "(.*?)"$/ do |words|
  $subdomain.should == words
end

Then /^the subdomain block should not have been run$/ do
  $subdomain.should_not == "www"
end

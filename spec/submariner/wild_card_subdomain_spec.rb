require 'spec_helper'
describe Submariner::WildCardSubdomain do

  it "it should allow you to configure ignored subdomains" do
    subject.config do |config|
      config.subdomains_to_ignore = ["www"]
    end
    subject.subdomains_to_ignore.should == ["www"]
  end
end

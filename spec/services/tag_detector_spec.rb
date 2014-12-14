require 'rails_helper'


describe TagDetector do 
  it "detects tags in text" do 
    ["one", "two", "three"].each {|t| Tag.create(:name => t)}
    td = TagDetector.new
    tags = td.detect("this is one of the best two texts ever and one is here again")
    expect(tags).to eq ["one", "two"].to_set
  end
end
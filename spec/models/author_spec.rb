require 'rails_helper'

RSpec.describe Author, :type => :model do

  it "needs name" do 
    author = FactoryGirl.build(:author)
    author.name = nil
    expect(author).not_to be_valid
  end

  it "needs biography" do 
    author = FactoryGirl.build(:author)
    author.biography = nil
    expect(author).not_to be_valid
  end
end

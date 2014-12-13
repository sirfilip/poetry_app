require 'rails_helper'

RSpec.describe Author, :type => :model do
  def valid_author_params
    {
      :name => 'John',
      :biography => 'Born in the usa',
    }
  end

  it "needs name" do 
    author = Author.new(valid_author_params)
    author.name = nil
    expect(author).not_to be_valid
  end

  it "needs biography" do 
    author = Author.new(valid_author_params)
    author.biography = nil
    expect(author).not_to be_valid
  end
end

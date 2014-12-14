require 'rails_helper'

RSpec.describe Author, :type => :model do

  [:name, :biography, :user, :user_id].each do |prop|
    it "needs #{prop}" do 
      author = FactoryGirl.build(:author)
      author.send(:"#{prop}=", nil)
      expect(author).not_to be_valid
    end
  end

end

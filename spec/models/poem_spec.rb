require 'rails_helper'

RSpec.describe Poem, :type => :model do
  [:title, :content, :metaphor, :published_at, :author].each do |prop|
    it "needs #{prop}" do 
      poem = FactoryGirl.build(:poem)
      poem.send(:"#{prop}=", nil)
      expect(poem).not_to be_valid
    end
  end
end

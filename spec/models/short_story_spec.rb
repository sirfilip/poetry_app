require 'rails_helper'

RSpec.describe ShortStory, :type => :model do
  
  [:author, :title, :content, :description, :published_at].each do |prop|
    it "must have #{prop}" do 
      story = FactoryGirl.build(:short_story)
      story.send(:"#{prop}=", nil)
      expect(story).not_to be_valid
    end
  end

  
end

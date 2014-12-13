require 'rails_helper'


RSpec.describe Publication do 

  describe "#latest" do 
    it "fetches the latest 10 publications" do 
      poems = []
      stories = []
      5.times {|n| poems << "Poem#{n}"}
      5.times {|n| stories << "Story#{n}"}
      poems.each {|poem| FactoryGirl.create(:poem, :title => poem, :published_at => 2.days.ago) }
      stories.each {|story| FactoryGirl.create(:short_story, :title => story, :published_at => 2.days.ago) }
      old_story = FactoryGirl.create(:short_story, :published_at => 10.days.ago)
      publications = Publication.latest
      publications.each do |publication|
        expect(poems + stories).to include(publication['title'])
      end
      expect(publications.map{|p| p['title']}).not_to include(old_story.title)
    end
  end



end

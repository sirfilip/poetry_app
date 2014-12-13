require 'rails_helper'

describe "Pages" do 
  
  describe "HomePage" do 
    it "should show latest 10 published poems/stories" do
      poem_titles = []
      short_story_titles = []
      5.times do |n|
        poem_titles << "Poem#{n}"
        short_story_titles << "Story#{n}"
      end
      poem_titles.each do |title|
        FactoryGirl.create(:poem, :published_at => 1.day.ago, :title => title)
      end
      short_story_titles.each do |title|
        FactoryGirl.create(:short_story, :published_at => 1.day.ago, :title => title)
      end
      FactoryGirl.create(:short_story, :published_at => 2.days.ago, :title => 'An older story')
      
      visit root_path 

      poem_titles.each do |title|
        expect(page).to have_content(title)
      end

      short_story_titles.each do |title|
        expect(page).to have_content(title)
      end

      expect(page).not_to have_content('An older story')
    end

    describe "Publication Poem Details" do 
      before do 
        @poem = FactoryGirl.create(:poem)
        visit root_path
      end

      it "should show information about the publication type" do 
        expect(page).to have_content(/Published as: .*poem/i)
      end

      it "should show the poems title" do 
        expect(page).to have_content(@poem.title)
      end

      it "should show the poems metaphor" do 
        expect(page).to have_content(@poem.metaphor)
      end

      it "should show information about the author" do 
        expect(page).to have_content(/Authored by: .*#{@poem.author.name}/i)
      end

      it "should show the publication date" do 
        expect(page).to have_content(@poem.published_at.to_s(:normal))
      end

    end

    describe "Publication Short Story Details" do 
      before do 
        @story = FactoryGirl.create(:short_story)
        visit root_path
      end

      it "should show information about the publication type" do 
        expect(page).to have_content(/Published as: .*Short Story/i)
      end

      it "should show the stories title" do 
        expect(page).to have_content(@story.title)
      end

      it "should show the stories description" do 
        expect(page).to have_content(@story.description)
      end

      it "should show information about the author" do 
        expect(page).to have_content(/Authored by: .*#{@story.author.name}/i)
      end

      it "should show the publication date" do 
        expect(page).to have_content(@story.published_at.to_s(:normal))
      end

    end
  end


end

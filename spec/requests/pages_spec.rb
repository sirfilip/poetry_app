require 'rails_helper'

describe "Pages" do 

  describe "MainMenu" do
    before do 
      visit root_path
    end

    it "should have a link to the home page" do 
      expect(page).to have_xpath("//a[@href='#{root_path}']")
    end

    it "should have a link to the Short Stories page" do
      expect(page).to have_xpath("//a[@href='#{short_stories_path}']")
    end

    it "should have a link to the Poems page" do 
      expect(page).to have_xpath("//a[@href='#{poems_path}']")
    end
  end
  
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
        expect(page).to have_content('poem')
      end

      it "should show the poems title" do 
        expect(page).to have_content(@poem.title)
      end

      it "should show the poems metaphor" do 
        expect(page).to have_content(@poem.metaphor)
      end

      it "should show information about the author" do 
        expect(page).to have_content(@poem.author.name)
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
        expect(page).to have_content('shortstory')
      end

      it "should show the stories title" do 
        expect(page).to have_content(@story.title)
      end

      it "should show the stories description" do 
        expect(page).to have_content(@story.description)
      end

      it "should show information about the author" do 
        expect(page).to have_content(@story.author.name)
      end

      it "should show the publication date" do 
        expect(page).to have_content(@story.published_at.to_s(:normal))
      end

    end
  end


end

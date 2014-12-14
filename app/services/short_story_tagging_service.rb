class ShortStoryTaggingService 
  attr_reader :tag_detector, :short_story

  def initialize(short_story)
    @short_story = short_story
    @tag_detector = TagDetector.new
  end

  def tag!
    apply_tagging_for(detect_tags)
  end

  private 

  def detect_tags
    tags = tag_detector.detect(short_story.content)
    Tag.where(:name => tags.to_a).to_a
  end 

  def apply_tagging_for(tags)
    short_story.taggings.delete_all
    tags.each do |t|
      short_story.taggings.create(:tag_id => t.id)
    end
  end

end
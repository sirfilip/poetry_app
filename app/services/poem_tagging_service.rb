class PoemTaggingService 
  attr_reader :tag_detector, :poem

  def initialize(poem)
    @poem = poem
    @tag_detector = TagDetector.new
  end

  def tag!
    apply_tagging_for(detect_tags)
  end

  private 

  def detect_tags
    tags = tag_detector.detect(poem.content)
    Tag.where(:name => tags.to_a).to_a
  end 

  def apply_tagging_for(tags)
    poem.taggings.delete_all
    tags.each do |t|
      poem.taggings.create(:tag_id => t.id)
    end
  end

end
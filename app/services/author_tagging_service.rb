class AuthorTaggingService 
  attr_reader :tag_detector, :author

  def initialize(author)
    @author = author 
    @tag_detector = TagDetector.new
  end

  def tag!
    apply_tagging_for(detect_tags)
  end

  private 

  def detect_tags
    tags = tag_detector.detect(author.biography)
    Tag.where(:name => tags.to_a).to_a
  end 

  def apply_tagging_for(tags)
    author.taggings.delete_all
    tags.each do |t|
      author.taggings.create(:tag_id => t.id)
    end
  end

end
class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  
  has_many :authors, :through => :taggings, :source => :taggable, :source_type => "Author"

  has_many :poems, ->{where(:type => 'Poem')}, :through => :taggings, :source => :taggable, :source_type => "Publication"
  has_many :short_stories, ->{where(:type => 'ShortStory')}, :through => :taggings, :source => :taggable, :source_type => "Publication"

end

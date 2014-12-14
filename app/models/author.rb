class Author < ActiveRecord::Base
  has_many :short_stories, :inverse_of => :author
  has_many :poems, :inverse_of => :author
  has_many :publications, :inverse_of => :author

  validates_presence_of :name, :biography
end

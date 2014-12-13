class Author < ActiveRecord::Base
  has_many :short_stories, :inverse_of => :author

  validates_presence_of :name, :biography
end

class Author < ActiveRecord::Base
  validates :name, :presence => true
  validates :biography, :presence => true
end

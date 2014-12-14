class Publication < ActiveRecord::Base
  belongs_to :author, :inverse_of => :publications

  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  scope :by, lambda {|author| where(:author_id => (author.try(:id) || 0))}

  scope :latest, lambda {order("id desc").limit(10)}


  paginates_per 10

end

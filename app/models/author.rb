class Author < ActiveRecord::Base

  model_name.instance_variable_set(:@route_key, 'author')

  has_many :short_stories, :inverse_of => :author
  has_many :poems, :inverse_of => :author
  has_many :publications, :inverse_of => :author

  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggable

  belongs_to :user, :inverse_of => :author


  validates_presence_of :name, :biography

  validate :must_have_user

  private


  def must_have_user
    if user.blank? && user_id.blank?
      self.errors.add(:user, I18n.t("errors.messages.existence"))
    end
  end

end

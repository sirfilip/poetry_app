class Poem < ActiveRecord::Base
  belongs_to :author, :inverse_of => :poems
  
  validate :must_have_author
  validates_presence_of :title, :content, :published_at, :metaphor

  private

  def must_have_author
    if author.blank? && author_id.blank?
      self.errors.add(:author, I18n.t("errors.messages.existence"))
    end
  end
end

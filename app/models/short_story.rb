class ShortStory < Publication
  belongs_to :author, :inverse_of => :short_stories

  validate :must_have_author

  validates_presence_of :title, :content, :description, :published_at

  private

  def must_have_author
    if author.blank? && author_id.blank?
      self.errors.add(:author, I18n.t("errors.messages.existence"))
    end
  end

end

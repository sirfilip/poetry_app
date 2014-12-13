class PublicationPresenter < BasePresenter
  presents :publication

  def title
    publication['title']
  end

  def excerpt
    publication['excerpt']
  end

  def author
    publication['author_name']
  end

  def published
    Date.strptime(publication['published_at'], '%Y-%m-%d').to_s(:normal)
  end

  def type
    publication['type'].downcase
  end
end

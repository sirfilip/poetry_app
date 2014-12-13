class PublicationPresenter < BasePresenter
  presents :publication

  def title
    publication['title']
  end

  def link_to_page
    if publication['type'] == 'Poem'
      h.link_to publication['title'], h.poem_path(publication['id'])
    else
      h.link_to publication['title'], h.short_story_path(publication['id'])
    end
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

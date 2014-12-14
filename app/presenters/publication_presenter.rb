class PublicationPresenter < BasePresenter
  presents :publication

  def title
    publication.title
  end

  def link_to_page
    if publication.type == 'Poem'
      h.link_to publication.title, h.poem_path(publication.id)
    else
      h.link_to publication.title, h.short_story_path(publication.id)
    end
  end

  def excerpt
    publication.description
  end

  def author
    publication.author.name
  end

  def published
    publication.published_at.to_s(:normal)
  end

  def type
    publication.type.downcase
  end
end

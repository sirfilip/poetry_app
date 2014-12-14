class PagesController < ApplicationController
  def home
    @publications = Publication.latest.preload(:author, :tags).page(params[:page])
  end

  def dashboard
    authenticate_user!
    @poems = Poem.by(current_user.author)
    @short_stories = ShortStory.by(current_user.author)
  end
end

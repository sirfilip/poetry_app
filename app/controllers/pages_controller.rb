class PagesController < ApplicationController
  def home
    @publications = Publication.eager_load(:author).latest
  end
end

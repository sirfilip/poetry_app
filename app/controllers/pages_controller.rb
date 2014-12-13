class PagesController < ApplicationController
  def home
    @publications = Publication.latest
  end
end

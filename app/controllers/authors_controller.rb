class AuthorsController < ApplicationController

  before_action :authenticate_user!

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.user = current_user
    if @author.save 
      AuthorTaggingService.new(@author).tag!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @author = current_user.author
  end

  def update
    if current_user.author.update_attributes(author_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private 

  def author_params
    params.require(:author).permit(:name, :biography)
  end


end
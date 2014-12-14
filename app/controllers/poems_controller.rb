class PoemsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @poems = Poem.latest.preload(:author, :tags).page(params[:page])
  end

  def new
    creation_policy_check!
    @poem = Poem.new 
  end

  def create
    return unless creation_policy_check!
    @poem = Poem.new(poem_params)
    @poem.author = current_user.author
    @poem.published_at = Date.today
    if @poem.save
      PoemTaggingService.new(@poem).tag!
      redirect_to poem_path(@poem)
    else
      render :new
    end
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def edit
    @poem = Poem.find(params[:id])
    change_policy_check!(@poem)
  end

  def update
    @poem = Poem.find(params[:id])
    return unless change_policy_check!(@poem)
    if @poem.update_attributes(poem_params)
      redirect_to poem_path(@poem)
    else
      render :edit
    end
  end

  def destroy
  end

  private 

  def creation_policy_check!
    policy = PublicationCreationPolicy.new(current_user)
    if policy.check!
      true
    else
      redirect_to root_path, :notice => policy.message unless policy.check!
      false
    end
  end

  def change_policy_check!(publication)
    policy = PublicationChangePolicy.new(current_user, publication)
    if policy.check!
      true
    else
      redirect_to root_path, :notice => policy.message unless policy.check!
      false
    end
  end

  def poem_params
    params.require(:poem).permit(:title, :content, :metaphor)
  end
end

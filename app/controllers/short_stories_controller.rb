class ShortStoriesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @short_stories = ShortStory.latest.preload(:author, :tags).page(params[:page])
  end


  def new
    creation_policy_check!
    @short_story = ShortStory.new 
  end

  def create
    return unless creation_policy_check!
    @short_story = ShortStory.new(short_story_params)
    @short_story.author = current_user.author
    @short_story.published_at = Date.today
    if @short_story.save
      ShortStoryTaggingService.new(@short_story).tag!
      redirect_to short_story_path(@short_story)
    else
      render :new
    end
  end

  def show
    @short_story = ShortStory.find(params[:id]) 
  end

  def edit
    @short_story = ShortStory.find(params[:id])
    return unless change_policy_check!(@short_story)
  end

  def update
    @short_story = ShortStory.find(params[:id])
    return unless change_policy_check!(@short_story)
    if @short_story.update_attributes(short_story_params)
      redirect_to short_story_path(@short_story)
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

  def short_story_params
    params.require(:short_story).permit(:title, :content, :description)
  end

end
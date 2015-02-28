class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    #debugger
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      # Handle a successful save.
      flash[:success] = "New story added!"
      redirect_to @story
    else
      render 'new'
    end

  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    Story.find(params[:id]).destroy
    flash[:success] = "Story deleted"
    redirect_to stories_url
  end


  private

  def story_params
    params.require(:story).permit(:title, :description, :point, :stage)
  end

end

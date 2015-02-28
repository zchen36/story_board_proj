class StoriesController < ApplicationController

  def new
<<<<<<< HEAD
    @story = Story.new
  end

  def index
    @stories = Story.all
=======
  	@story = Story.new
  end

  def index
  	@stories = Story.all
>>>>>>> 33fc61c48db5b209a2ee0e600847b314156f98ae
  end

  def show
    @story = Story.find(params[:id])
    #debugger
  end

  def create
<<<<<<< HEAD
    @story = Story.new(story_params)
=======
	@story = Story.new(story_params)
>>>>>>> 33fc61c48db5b209a2ee0e600847b314156f98ae
    if @story.save
      # Handle a successful save.
      flash[:success] = "New story added!"
      redirect_to @story
    else
      render 'new'
    end

  end

  def edit
<<<<<<< HEAD
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
=======
  	@story = Story.find(params[:id])
  end

  def update
  	@story = Story.find(params[:id])
>>>>>>> 33fc61c48db5b209a2ee0e600847b314156f98ae
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
<<<<<<< HEAD
    Story.find(params[:id]).destroy
    flash[:success] = "Story deleted"
    redirect_to stories_url
=======
  	Story.find(params[:id]).destroy
    flash[:success] = "Story deleted"
  	redirect_to stories_url
>>>>>>> 33fc61c48db5b209a2ee0e600847b314156f98ae
  end


  private

  def story_params
<<<<<<< HEAD
    params.require(:story).permit(:title, :description, :point, :stage)
=======
    params.require(:story).permit(:title, :description, :point, :stage, :storys)
>>>>>>> 33fc61c48db5b209a2ee0e600847b314156f98ae
  end

end

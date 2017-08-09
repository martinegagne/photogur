class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @prev_month = Picture.prev_month(1.month.ago)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
   @picture = Picture.new
 end

  def create
    @picture = Picture.new

    @picture = Picture.new(pictures_params)

    if @picture.save
      redirect_to "/pictures"
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture = Picture.new(pictures_params)

    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  def pictures_params
  params.require(:picture).permit(:artist, :title, :url)
  end

end

class PicturesController < ApplicationController  
  def destroy
    @picture = Picture.find(params[:id])
    if @picture.present?
      @picture.destroy
    end
    redirect_to :back
  end
end
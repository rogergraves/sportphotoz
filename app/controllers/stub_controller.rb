class StubController < ApplicationController
  def add_to_cart
    @photo = Photo.find(params[:photo])

    respond_to do |format|
      format.js
    end
  end
end
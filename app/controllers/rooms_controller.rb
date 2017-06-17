class RoomsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    render json: {result: "post ok"}
    return
  end

  def show
    render json: {result: "ok"}
    return
  end
end

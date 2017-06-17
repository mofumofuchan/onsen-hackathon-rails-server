class MessagesController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    render json: {"result":" messages post ok"}
    return
  end

  def index
  end
end

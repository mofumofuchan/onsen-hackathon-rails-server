class RoomsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    room_param = params.permit(:name, :username)

    if Room.find_by(name: room_param["name"]).nil?
      room = Room.new(name: room_param["name"], username: room_param["username"])
      room.save!
      render json: {"result": "created", "room_name": room.name}
      return
    else
      render json: {"result": "connected"}
      return
    end
  end

  def show
    render json: {result: "ok"}
    return
  end
end
ap

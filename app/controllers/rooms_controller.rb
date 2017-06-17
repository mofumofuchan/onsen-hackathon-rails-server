class RoomsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    room_param = params.permit(:name, :username)

    room = Room.find_by(name: room_param["name"])
    if room.nil?
      room = Room.new(name: room_param["name"], username: room_param["username"])
      room.save!
      render json: {"result": "created", "room_name": room.name}
      return
    else
      room.is_connected = true
      render json: {"result": "connected", "room_name": room.name}
      return
    end
  end

  def show
    room_param = params.permit(:name, :username)

    room = Room.find_by(name: room_param["name"])
    if room.nil?
      render json: {"result": "not found"}, status: 404
      return
    end

    if room.is_connected
      render json: {"result": "connected", "room_name": room.name}
      return
    else
      render json: {"result": "waiting", "room_name": room.name}
      return
    end
  end
end

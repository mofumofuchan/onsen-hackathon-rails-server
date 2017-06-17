class MessagesController < ApplicationController
  protect_from_forgery except: [:create]
  NUM_RECENT_MESSAGES = 100

  def create
    message_param = params.permit(:username, :roomname, :perfume, :message)

    message = Message.new()
    message.username = message_param["username"]
    room = Room.find_by(name: message_param["roomname"])
    if room.nil? 
      render json: {"result": "room not found"}, status: 404
      return
    end
    message.room = room
    message.message = message_param["message"]
    message.perfume = message_param["perfume"]
    message.save!
    
    render json: {"result": "created"}, status: 201
    return
  end

  def index
    message_param = params.permit(:roomname)
    room = Room.find_by(name: message_param["roomname"])
    if room.nil?
      render json: {"result": "room not found"}, status: 404
      return
    end
    messages = Message.where(room: room).
               order("updated_at DESC").limit(NUM_RECENT_MESSAGES)
    messages_json = messages.map do |m|
      {"username": m.username,
       "message": m.message,
       "perfume": m.perfume
      }
    end
    render json: messages_json
    return
  end
end

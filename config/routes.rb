Rails.application.routes.draw do
  get 'messages/create'

  get 'messages/index'

  root 'static_pages#show'

  scope 'api' do
    scope 'v0' do
      scope 'rooms' do
        post '/:roomname', to: "messages#create"
        get '/:roomname', to: "messages#index"
        post '/', to: "rooms#create"
        get '/', to: "rooms#show"
      end
    end
  end
end

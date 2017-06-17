Rails.application.routes.draw do
  root 'static_pages#show'

  scope 'api' do
    scope 'v0' do
      scope 'rooms' do
        post '/', to: "rooms#create"
        get '/', to: "rooms#show"
      end
    end
  end
end

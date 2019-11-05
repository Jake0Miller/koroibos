Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/olympians', to: 'olympians#index'
      get '/olympian_stats', to: 'olympian_stats#show'
      get '/events', to: 'events#index'
      get '/events/:id/medalists', to: 'medalists#index'
    end
  end
end

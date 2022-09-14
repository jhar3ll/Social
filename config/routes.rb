Rails.application.routes.draw do
  resources :fetches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/twitter', to: 'fetches#show_twitter'
  get '/facebook', to: 'fetches#show_facebook'
  get '/instagram', to: 'fetches#show_instagram'
  get '/', to: 'fetches#index'
end

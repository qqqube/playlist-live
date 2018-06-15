Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :users
  resources :playlists
  resources :songs
 
  post '/playlists', to: "playlists#create", as: "create_playlist"
  get '/join', to: "playlists#join", as: "new_join"
  post '/grant_access', to: "playlists#grant_access", as: "grant_access"
  



  post '/delete', to: "songs#destroy", as: "delete_song"
  post '/songs', to: "songs#create", as: "create_song"
  get '/remove_song', to: "songs#remove_song", as: "remove_song"



end

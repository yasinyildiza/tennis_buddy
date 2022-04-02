Rails.application.routes.draw do
  resources :match_sets

  resources :user_matches

  resources :invited_users

  resources :ratings

  resources :messages

  resources :users

  resources :tennis_clubs

  resources :tennis_courts

  resources :skill_levels

  resources :cities do
    get 'update_tennis_clubs', on: :collection, action: :update_tennis_clubs, as: :update_tennis_clubs
    get 'update_tennis_courts', on: :collection, action: :update_tennis_courts, as: :update_tennis_courts
    get 'update_tennis_clubs_search', on: :collection, action: :update_tennis_clubs_search, as: :update_tennis_clubs_search
    get 'update_tennis_courts_search', on: :collection, action: :update_tennis_courts_search, as: :update_tennis_courts_search
  end

  resources :genders

  get 'new_broadcast_to_city', to: 'messages#new_broadcast_to_city', as: :new_broadcast_to_city
  post 'create_broadcast_to_city', to: 'messages#create_broadcast_to_city', as: :create_broadcast_to_city

  get 'new_broadcast_to_tennis_club', to: 'messages#new_broadcast_to_tennis_club', as: :new_broadcast_to_tennis_club
  post 'create_broadcast_to_tennis_club', to: 'messages#create_broadcast_to_tennis_club', as: :create_broadcast_to_tennis_club

  get 'new_broadcast_to_tennis_court', to: 'messages#new_broadcast_to_tennis_court', as: :new_broadcast_to_tennis_court
  post 'create_broadcast_to_tennis_court', to: 'messages#create_broadcast_to_tennis_court', as: :create_broadcast_to_tennis_court

  get 'new_broadcast_to_gender', to: 'messages#new_broadcast_to_gender', as: :new_broadcast_to_gender
  post 'create_broadcast_to_gender', to: 'messages#create_broadcast_to_gender', as: :create_broadcast_to_gender

  get 'new_broadcast_to_skill_level', to: 'messages#new_broadcast_to_skill_level', as: :new_broadcast_to_skill_level
  post 'create_broadcast_to_skill_level', to: 'messages#create_broadcast_to_skill_level', as: :create_broadcast_to_skill_level

  get 'new_current_user_match', to: 'user_matches#new_current_user_match', as: :new_current_user_match
  post 'create_current_user_match', to: 'user_matches#create_current_user_match', as: :create_current_user_match

  post 'broadcast_message_to_list', to: 'users#broadcast_message_to_list', as: :broadcast_message_to_list

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, :skip => [:registrations]
  
  devise_scope :users do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end

  get 'model_list', to: 'home#model_list', as: :model_list
  get 'action_list', to: 'home#action_list', as: :action_list
  
  get 'user_inbox', to: 'users#inbox', as: :user_inbox
  get 'user_outbox', to: 'users#outbox', as: :user_outbox
  get 'similar_users', to: 'users#similar_users', as: :similar_users
  get 'users_matches', to: 'users#users_matches', as: :users_matches

  root to: "home#action_list"

end
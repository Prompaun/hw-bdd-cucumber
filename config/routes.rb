# Rottenpotatoes::Application.routes.draw do
#   #get 'pages/home'
#   # resources :movies

#   resources :movies do
#     resources :reviews
#   end
#   resources :users do
#     resources :reviews
#   end

# # config/routes.rb

#   # # เพิ่มส่วนนี้เพื่อสร้างเส้นทางสำหรับการสร้างรีวิวใหม่
#   # resources :reviews, only: [:new, :create]
  
#   # # เพิ่มส่วนนี้หากคุณยังมีเส้นทางสำหรับหน้าหลักของหนัง หรืออื่นๆ ที่คุณต้องการ
#   # resources :movies

#   # map '/' to be a redirect to '/movies'
 
#   #root :to => redirect('/movies')
#   #root :to => redirect('/users/sign_in')
#   #root :to => redirect(new_user_session_path)
#   #root 'pages#home'
  
#   devise_for :users, controllers: {
#     registrations:'users/registrations',
#     sessions: 'users/sessions',
#     omniauth_callbacks: 'users/omniauth_callbacks',
#   }
#   #root to: 'movies#index'
#   root :to => redirect('/movies')
#   post "/movies/search_tmbd" => 'movies#search_tmdb', :as => 'search_tmdb'
#   #root 'devise/sessions#new'
# end

Rottenpotatoes::Application.routes.draw do
  resources :tests
  devise_for :moviegoers, controllers: {
    omniauth_callbacks: 'moviegoers/omniauth_callbacks',
    sessions: 'moviegoers/sessions',
    registrations: 'moviegoers/registrations'
    }

  # resources :movies do
  #   resources :reviews
  # end

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  resources :moviegoers do
    resources :reviews
  end
  
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  post '/movies/search_tmdb' => 'movies#search_tmdb', :as => 'search_tmdb'
end
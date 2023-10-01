Rottenpotatoes::Application.routes.draw do
  #get 'pages/home'
  # resources :movies

  resources :movies do
    resources :reviews
  end

# config/routes.rb

  # # เพิ่มส่วนนี้เพื่อสร้างเส้นทางสำหรับการสร้างรีวิวใหม่
  # resources :reviews, only: [:new, :create]
  
  # # เพิ่มส่วนนี้หากคุณยังมีเส้นทางสำหรับหน้าหลักของหนัง หรืออื่นๆ ที่คุณต้องการ
  # resources :movies

  # map '/' to be a redirect to '/movies'
  root to: 'movies#index'
  #root :to => redirect('/movies')
  #root :to => redirect('/users/sign_in')
  #root :to => redirect(new_user_session_path)
  #root 'pages#home'
  
  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  #root 'devise/sessions#new'
end

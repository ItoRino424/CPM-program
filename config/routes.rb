Rails.application.routes.draw do
  devise_for :users
  get 'quiz/index'
  get 'quiz/new'
  get 'quiz/show'
  get 'quiz/edit'
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "home#top"
  get "about" => "home#about"

  get "quiz/index" => "quiz#index"
  get "seikou" => "quiz#quiz-2"

  get "users/sign_up" => "devise/sessions#new"

  get "quizzes/index" => "quizzes#index"
  get "quizzes/new" => "quizzes#new"
  post "quizzes/create" => "quizzes#create"
  resources :quizzes

  get "rankings/index" => "rankings#index"
  
end

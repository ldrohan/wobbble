Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: :profile

  devise_for :users
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end  
    resources :comments
  end

  root 'posts#index'
end

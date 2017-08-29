UserTweets::Application.routes.draw do
  root :to => "users#index"
  resources :users do
    resources :tweets, :tools
  end

  resources :tweets
end

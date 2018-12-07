Rails.application.routes.draw do
  root 'epicenter#feed'
  resources :tweets
  devise_for :users
  resources :products
  get 'show_user' => 'epicenter#show_user'

  get 'now_following' => 'epicenter#now_following'

  get 'unfollow' => 'epicenter#unfollow'

  get 'all_users' => 'epicenter#all_users'

  get 'tag_tweets' => 'epicenter#tag_tweets'

  get 'following' => 'epicenter#following'

  get 'followers' => 'epicenter#followers'


end

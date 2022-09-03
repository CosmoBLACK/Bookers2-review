Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'following' => 'relationships#following', as: 'following'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, only: [:show, :index, :edit, :create, :update] do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only: [:create, :destroy] # showページが不要で、idの受け渡しも必要ないのでresourceを使う。ネストすることで、どの投稿(book_id)にいいねを付けたかが特定できる。
  end
end

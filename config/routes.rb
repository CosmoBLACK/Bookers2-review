Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:show, :index, :edit, :create, :update] do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only: [:create, :destroy] # showページが不要で、idの受け渡しも必要ないのでresourceを使う。ネストすることで、どの投稿(book_id)にいいねを付けたかが特定できる。
  end
end

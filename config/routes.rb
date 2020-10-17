Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # rootのルーティング
  root to: 'tasks#index'
  
  # ログインページ表示
  get 'login', to: 'sessions#new'
  # ログイン情報をセッションで保存
  post 'login', to: 'sessions#create'
  # ログアウト（保存したログイン情報を削除）
  delete 'logout', to: 'sessions#destroy'
  
  # ユーザの新規登録ページ表示
  get 'signup', to: 'users#new'
  
  resources :tasks
  resources :users, only: [:create]
end

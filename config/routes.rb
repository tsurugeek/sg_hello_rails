Rails.application.routes.draw do
  # 下記一行だけでentriesに関するindex,new,create,edit,update,destroyアクションが追加される。
  resources :blogs do
    resources :entries, except: [:index] do
      resources :comments, only: [:create, :destroy] do
        put 'approve', on: :member
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # 下記一行だけでentriesに関するindex,new,create,edit,update,destroyアクションが追加される。
  resources :entries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

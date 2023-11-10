Rails.application.routes.draw do
   root "tasks#index"

   resources :tasks do
    patch :change_status, on: :member
  end
end

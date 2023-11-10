Rails.application.routes.draw do
   root "tasks#index"

   resources :tasks do
      member do
        patch :change_status, to: "task_status_changes#change_status"
      end
  end
end

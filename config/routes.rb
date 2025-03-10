Rails.application.routes.draw do
  devise_for :users,
    defaults: { format: :json },
    path: "/api/v1",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      registration: "signup"
    },
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  namespace :api do
    namespace :v1 do
      resources :projects, only: %i[index show create update destroy]
      resources :tasks, only: %i[index show create update destroy]
    end
  end
end

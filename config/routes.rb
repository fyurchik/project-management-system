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

end

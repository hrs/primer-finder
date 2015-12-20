Rails.application.routes.draw do
  root to: "homes#show"

  resource :search_results, only: [:create]
end

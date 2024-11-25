Rails.application.routes.draw do
  resources :users, only: %i[show new create index]

  resources :courses do
    resources :enrolments, only: %i[new create destroy update]
    resources :lessons do
      resources :comments
    end
  end

  resources :course_lessons, only: %i[update destroy]
  get "up" => "rails/health#show", as: :rails_health_check
end

Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    delete 'sign_out' => 'devise/sessions#destroy'
  end

  get "page" => "pages#index"

  root "top#index"
end

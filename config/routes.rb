Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/:locale', locale: /en/ do
    resource :users, only: :create do
      get '/email/confirm/:token', to: 'users#confirm_email', as: 'mail_confirm', token: %r{[^/]+}
    end
  end
end

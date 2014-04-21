Financials::Application.routes.draw do
  root 'transactions#index'
  resources :transactions, except: ['edit', 'update', 'new', 'create', 'destroy']
  resources :description_tags, except: ['edit', 'update', 'show']

  get 'upload/new' => 'upload#new', as: 'new_upload'
  post 'upload/account_data' => 'upload#account_data', as: 'upload_account_data'
  post 'upload/credit_card_data' => 'upload#credit_card_data', as: 'upload_credit_card_data'
  post 'upload/description_tags' => 'upload#description_tags', as: 'upload_description_tags'
  get 'reports' => 'reports#index', as: 'reports'
end

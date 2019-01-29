Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'silly', to: 'silly#fun'
  post 'silly', to: 'silly#time'
  post 'silly/:id', to: 'silly#super'
end



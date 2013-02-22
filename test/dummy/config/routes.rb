Rails.application.routes.draw do

  mount Vipload::Engine => "/vipload"
  
  root to: "uploader#new"
end

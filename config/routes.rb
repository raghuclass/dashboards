Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "application", :action => "home" })
  get("/forex", { :controller => "application", :action => "forex" })
  get("/covid", { :controller => "application", :action => "covid" })
  get("/forex/:symbol", { :controller => "application", :action => "convert_from" })
  get("/forex/:symbol1/:symbol2", { :controller => "application", :action => "convert_from_to" })
end

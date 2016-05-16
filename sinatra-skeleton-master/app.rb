class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :frontpage, layout: false
  end


end
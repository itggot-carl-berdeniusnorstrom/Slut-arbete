class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :frontpage, layout: false
  end

  get '/registration' do
    erb :registration, layout: false
  end

  post '/register' do
    username = params['username']

  end
end
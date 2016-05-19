class App < Sinatra::Base
  enable :sessions

  before do
    @user = User.get session[:user_id] if session[:user_id]
  end
  get '/' do
    erb :frontpage, layout: false
  end

  post '/login' do
    account = Acount.first(username: params["login"])
    if account && account.password == params["word"]
      session[:account_id] = account.id
      redirect '/'
    end
    redirect '/list-page'
  end

  get '/registration' do
    erb :registration, layout: false
  end

  post '/register' do
    account = Acount.create(mail: params['mail'],
                  username: params['user'],
                  fullname: params['namn'],
                  password: params['password'],
                  date: params['bday'],)

    if account.valid?
      redirect '/'
    else
      redirect '/registration'
    end
  end
end
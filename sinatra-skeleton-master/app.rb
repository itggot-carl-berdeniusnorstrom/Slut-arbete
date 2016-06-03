class App < Sinatra::Base
  enable :sessions

  before do
    @user = Acount.get(session[:account_id]) if session[:account_id]
    puts "\n"*3
    p @user.profiles if @user
    puts "\n"*3
  end
  get '/' do
    erb :frontpage, layout: false
  end

  post '/login' do
    account = Acount.first(username: params["login"])
    if account && account.password == params["word"]
      session[:account_id] = account.id
      redirect '/profilepage'
    end
    redirect '/'
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

  get '/profilepage' do
    erb :profilepage, layout: false
  end

  get '/crateprofile' do
    erb :createprofile, layout: false
  end

  post '/profilecrate' do
    Profile.create(name: params[:profilename], acount_id: 1)

    if params[:avatar] && (tmpfile = params[:avatar][:tempfile]) && (name = params[:avatar][:filename])
      filename = SecureRandom.urlsafe_base64
      extname = File.extname(name)

      while blk = tmpfile.read(65536)
        File.open("public/img/avatar/#{filename}#{extname}", "a+") do |file|
          file.write(blk)
        end
        # here you would write it to its final locatio

      end
      Profile.update(picture: "public/img/avatar/#{filename}#{extname}")
    end


    redirect "/profilepage"
  end

  get '/listpage' do
    "Hello World"
  end

end
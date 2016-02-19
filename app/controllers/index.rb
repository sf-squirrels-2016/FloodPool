get '/' do

  erb :'questions/index'
end

get '/secret' do
  redirect '/sessions/new' unless session[:user_id]
  "Secret area!"
end

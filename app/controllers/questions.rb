get '/questions/new' do
  erb :questions
end

post '/questions' do
  @user = User.find(session[:user_id])
  @question = @user.questions.new(params[:question])
  if @question.save
    redirect "/users/#{@user.id}"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers

  erb :"questions/show"
end


get '/questions' do
	erb :"questions/index"
end

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

get '/questions/:id/answers/new' do
  @question= Question.find(params[:id])
  erb :"answers/new"
end

post '/questions/:id/answers/new' do
  @user = User.find(session[:user_id])
  @question= Question.find(params[:id])
  @answer = @user.answers.new(params[:answer])
  @question.answers << @answer
  if @answer.save
    redirect "/users/#{@user.id}"
  end
end

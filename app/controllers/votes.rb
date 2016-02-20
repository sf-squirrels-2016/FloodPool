post '/votes/new' do
  p '#' * 80
  p params
  @vote = Vote.new(voting_on_type: params[:post], voting_on_id: params[:postId], vote_value: params[:value], user_id: session[:user_id])
  if @vote.save
    post = ''
    question_id = ''
    if @vote.voting_on_type == 'Question'
      post = Question.find(params[:postId])
      question_id = post.id
    elsif @vote.voting_on_type == 'Answer'
      post = Answer.find(params[:postId])
      question_id = post.question.id
    elsif @vote.voting_on_type == 'Comment'
      post = Comment.find(params[:postId])
      if post.troll_type == 'Question'
        question_id = post.troll_id
      else
        answer_id = post.troll_id
        answer = Answer.find(answer_id)
        question_id = answer.question.id
      end
    else
      # redirect "/questions/#{question_id}"
      p 'first redirect'
    end
    if request.xhr?
      p "!$@!$$!!!!!!!!!!!!!!!"
      p post
      content_type :json
      { votes: post.count_votes, question_id: question_id }.to_json
    else
      # redirect '/questions/#{question_id}'
      p 'second redirect'
    end
  else
    @error = "Could not process vote"
    # redirect '/questions/#{question_id}'
    p "third"
  end
end

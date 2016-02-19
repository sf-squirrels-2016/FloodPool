module Count

  def count_votes
    vote_count = 0
    self.votes.each do |vote|
      vote_count += vote.vote_value
    end
    vote_count
  end

end
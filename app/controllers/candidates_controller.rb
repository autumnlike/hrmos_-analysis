class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def summary
    @summary = Candidate.summary [10, 11, 12, 18, 28, 39, 86]
  end
end

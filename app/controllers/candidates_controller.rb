class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.where(
      job_id: [10, 11, 12, 18, 39, 86],
      status: [ '1次選考', '2次選考', '書類選考', '最終選考', '未対応', '内定']
    ).order(:entry_date)
  end

  def summary
    @summary = Candidate.summary [10, 11, 12, 18, 39, 86]
  end
end

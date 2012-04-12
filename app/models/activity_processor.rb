class ActivityProcessor
  def self.process(attempt, params)
    attempt.executions.create :solution => params[:solution].to_json, :suceeded => params[:suceeded]
  end
end

class Like < Thought
  def self.ranking
    self.group(:idol_id).order('count_idol_id DESC').limit(100).count(:idol_id)
  end
end

class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @idols = Idol.find(@ranking_counts.keys)
  end
end

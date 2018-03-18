class ToppagesController < ApplicationController
  def index
    @idols = Idol.all.page(params[:page])
  end
end

class ThoughtsController < ApplicationController
  def create
    @idol = Idol.find(params[:idol_id])
    if params[:type] == 'Like'
      current_user.like(@idol)
      flash[:success] = 'このアイドルを好きになりました。'
    else
      current_user.go_to_went(@idol)
     flash[:success] = 'このアイドルに会いに行きたい。'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @idol = Idol.find(params[:idol_id])
    if params[:type] == 'Like'
      current_user.unlike(@idol)
      flash[:success] = 'このアイドルに興味なくなりました。'
    else
      current_user.not_go(@idol)
      flash[:success] = '会いに行くのをやめました。'
    end
    redirect_back(fallback_location: root_path)
  end
end

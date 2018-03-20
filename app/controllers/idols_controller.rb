class IdolsController < ApplicationController
  
  def index
        @idols = Idol.all.page(params[:page])
  end

  def new
    @idol = Idol.new
  end
  
  def show
    @idol = Idol.find(params[:id])
    @like_users = @idol.think_likes
    @go_to_went_users = @idol.think_goes
  end

  def create
     @idol = Idol.new(idol_params)
      if @idol.save
      flash[:success] = 'アイドルが登録されました。'
      redirect_to idols_url
    else
      flash.now[:danger] = '作成に失敗しました。'
      render :new
    end
  end

  def destroy
    @idol = Idol.find(params[:id])
    @idol.destroy

    flash[:success] = '正常に削除されました'
    redirect_to idols_url
  end

 private
    def idol_params
    params.require(:idol).permit(:idol_name, :idol_content, :idol_url, :idol_image,:idol_image_cache )
  end
end
class AdministratorsController < ApplicationController
    
  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(administrator_params)

    if @administrator.save
      flash[:success] = '管理者を登録しました。'
      redirect_to idols_url
    else
      flash.now[:danger] = '管理者の登録に失敗しました。'
      render 'new'
    end
  end
  
    private

  def administrator_params
    params.require(:administrator).permit(:name, :password, :password_confirmation)
  end
end

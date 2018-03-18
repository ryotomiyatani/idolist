class AdminsessionsController < ApplicationController
  def new
  end

  def create
    name = params[:session][:name].downcase
    password = params[:session][:password]
    if login(name, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to idols_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:administrator_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  private

  def login(name, password)
    @administrator = Administrator.find_by(name: name)
    if @administrator && @administrator.authenticate(password)
      # ログイン成功
      session[:administrator_id] = @administrator.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
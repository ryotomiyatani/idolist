class InquiriesController < ApplicationController
   def index
     @inquiries = Inquiry.all.page(params[:page]).per(30)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
        @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      flash[:success] = ' 送信されました'
      redirect_to @inquiry
    else
      flash.now[:danger] = '送信されませんでした'
      render :new
    end
  end
  
  def destroy
        @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    flash[:success] = '正常に削除されました'
    redirect_to inquiry_path
  end
  end
  
   private

  # Strong Parameter
  def inquiry_params
    params.require(:inquiry).permit(:user, :email ,:content)
  end


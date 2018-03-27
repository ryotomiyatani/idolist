class ToppagesController < ApplicationController
  def index
           @idols = Idol.all.order(:idol_namekana).page(params[:page]).per(100)
        if params[:name].present? 
          @idols = Idol.order(:idol_namekana).get_by_idol_name(params[:name]).page(params[:page]).per(100)
        end

        if params[:name_a] == "あ"
          @idols = Idol.order(:idol_namekana).get_by_name_a("あ%").page(params[:page]).per(100)
        elsif params[:name_ka] == "か"
          @idols = Idol.order(:idol_namekana).get_by_name_ka("か%").page(params[:page]).per(100)
        elsif params[:name_sa] == "さ"
          @idols = Idol.order(:idol_namekana).get_by_name_sa("さ%").page(params[:page]).per(100)
        elsif params[:name_ta] == "た"
          @idols = Idol.order(:idol_namekana).get_by_name_ta("た%").page(params[:page]).per(100)
        elsif params[:name_na] == "な"
          @idols = Idol.order(:idol_namekana).get_by_name_na("な%").page(params[:page]).per(100)
        elsif params[:name_ha] == "は"
          @idols = Idol.order(:idol_namekana).get_by_name_ha("は%").page(params[:page]).per(100)
        elsif params[:name_ma] == "ま"
          @idols = Idol.order(:idol_namekana).get_by_name_ma("ま%").page(params[:page]).per(100)
        elsif params[:name_ya] == "や"
          @idols = Idol.order(:idol_namekana).get_by_name_ya("や%").page(params[:page]).per(100)
        elsif params[:name_ra] == "ら"
          @idols = Idol.order(:idol_namekana).get_by_name_ra("ら%").page(params[:page]).per(100)
        elsif params[:name_wa] == "わ"
          @idols = Idol.order(:idol_namekana).get_by_name_wa("わ%").page(params[:page]).per(100)
      end
  end
end

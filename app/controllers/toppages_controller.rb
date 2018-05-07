class ToppagesController < ApplicationController
  def index
        idols = Idol.all
        sort_by_idolname(idols)
        
           @idols = idols.page(params[:page]).per(100)
        if params[:name].present? 
          @idols = Idol.get_by_idol_name(params[:name]).order(:idol_namekana).page(params[:page]).per(100)
        end

        if params[:name_a] == "あ"
          @idols = Idol.get_by_name_a("あ%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_ka] == "か"
          @idols = Idol.get_by_name_ka("か%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_sa] == "さ"
          @idols = Idol.get_by_name_sa("さ%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_ta] == "た"
          @idols = Idol.get_by_name_ta("た%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_na] == "な"
          @idols = Idol.get_by_name_na("な%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_ha] == "は"
          @idols = Idol.get_by_name_ha("は%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_ma] == "ま"
          @idols = Idol.get_by_name_ma("ま%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_ya] == "や"
          @idols = Idol.get_by_name_ya("や%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_ra] == "ら"
          @idols = Idol.get_by_name_ra("ら%").order(:idol_namekana).page(params[:page]).per(100)
        elsif params[:name_wa] == "わ"
          @idols = Idol.get_by_name_wa("わ%").order(:idol_namekana).page(params[:page]).per(100)
      end
  end
  
  def sort_by_idolname(idols=[])
  origin = "ａ-ｚＡ-Ｚァ-ン０-９ぁぃぅぇぉがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゃゅょっゎァィゥェォガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポャュョッヮ"
  normalize = "a-zA-Zぁ-ん0-9あいうえおかきくけこさしすせそたちつてとはひふへほはひふへほやゆよつわあいうえおかきくけこさしすせそたちつてとはひふへほはひふへほやゆよつわ"

  idols.sort_by{|a| [a.idol_namekana.tr(origin, normalize)]}
end


end

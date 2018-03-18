module AdminsessionsHelper
    def current_admin
    @current_admin ||= Administrator.find_by(id: session[:administrator_id])
  end

  def admin_logged_in?
    !!current_admin
  end
end

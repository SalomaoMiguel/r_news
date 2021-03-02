class ApplicationController < ActionController::Base
  before_action :check_log

  def check_log
    if session[:usuario_logado] && session[:expire_time].to_time.try(:future?)
      @usuario_logado = User.find(session[:usuario_logado])
      session[:expire_time] = 60.minutes.from_now
    else
      return redirect_to dev_auth_login_path
      flash[:notice] = "Sua sessão expirou tempo de uso"
    end
  end

end

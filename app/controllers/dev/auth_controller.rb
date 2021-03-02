class Dev::AuthController < ApplicationController
  skip_before_action :check_log

  def login
    if request.post?
      @usuario_logado = User.autenticacao(params[:email], params[:senha]) #Autenticação do usuario
      if @usuario_logado
        session[:usuario_logado] = @usuario_logado.id
        session[:expire_time] = 30.minutes.from_now
        user_agent = UserAgent.parse(request.user_agent)
        UserRegistro.create(user: @usuario_logado, nome: @usuario_logado.nome, email: @usuario_logado.email, navegador:  user_agent.nil? ? "" : "#{user_agent.browser}", so: user_agent.nil? ? "" : "#{user_agent.os}")
        redirect_to dev_board_board_geral_path
        flash[:notice] = 'Bem vindo ao G2 News'
      else
        session[:usuario_logado] = nil
        reset_session
        flash[:error] = "Este email ou senha não confere na autenticação. Tente um válido"
      end
    end
  end

  def logout
    session[:usuario_logado] = nil
    reset_session
    redirect_to dev_root_path
    flash[:notice] = "Desconectado. Para entrar novamente, acesse o botão entrar"
  end

  #Post Get
  def new
    @usuario = User.new
    if request.post?
      @usuario.nome = params[:nome]
      @usuario.email = params[:email]
      @usuario.senha = params[:senha]
      @usuario.idioma = params[:idioma]
      @usuario.save
      redirect_to dev_auth_login_path
      flash[:notice] = "Seu cadastro foi realizado. Agora podera entrar na G2 News"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end

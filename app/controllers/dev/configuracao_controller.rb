class Dev::ConfiguracaoController < ApplicationController
  layout 'main'
  before_action :set_usuario
  def profile

  end
  def profile_edit

  end
  def noticia

  end
  def convite

  end
  def user

  end

  def set_usuario
    @usuario = @usuario_logado
  end

end

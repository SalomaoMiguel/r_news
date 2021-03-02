class Dev::BoardController < ApplicationController
  layout 'main'
  def board_geral
    @usuario = @usuario_logado
  end

end

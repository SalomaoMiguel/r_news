class Dev::HomeController < ApplicationController
  skip_before_action :check_log
  def index
  end
end

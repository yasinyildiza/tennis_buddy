class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
  	if params[:controller] == 'home' and params[:action] == 'action_list'
  		if current_user
  			redirect_to users_path
  		else
  			redirect_to '/login'
  		end
    elsif not (params[:controller] == 'devise/sessions' and params[:action] == 'new')
      flash[:alert] = I18n.t("alerts.require_login") unless current_user
      redirect_to '/login' unless current_user
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  
  #Custom route for devise, reroutes back to the homepage this is the root_path or root_url
  def after_sign_in_path_for(resource)
    if current_user.present?
      users_path
    else
      admin_root_path
    end
  end

  #Custom route for devise, after registration
  def after_sign_up_path_for(resource)
    users_path
  end

end

class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

  # 管理者とユーザのログイン後の遷移
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
    customers_my_page_path
    end
  end

  #管理者とユーザーのログアウト後の遷移
  def after_sign_out_path_for(resource)
      if resource == :admin
      new_admin_session_path
      else
      root_path
      end
    end

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
end
end

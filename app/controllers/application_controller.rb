class ApplicationController < ActionController::Base
  #formにセキュリティトークンを含める
  protect_from_forgery with: :exception

  #ストロングパラメータにnameを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end

end

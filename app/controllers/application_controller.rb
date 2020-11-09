class ApplicationController < ActionController::Base
  before_action :authenticate_user! #ログインしてなかったらログインへ
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:name])
  end

end


#   protect_from_forgery except: :search # searchアクションを除外
#     def index
#     end

#     def search
#       @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
#       redirect_to 'index'
#     end
#   end  
# end
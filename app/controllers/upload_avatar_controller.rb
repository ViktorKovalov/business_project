class UploadAvatarController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update
    super do |resourse|
      if resourse.errors.empty? && resourse.avatar.present?
        redirect_to user_profile_path
        flash[:success] = 'Avatar was successfully updated.'
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:avatar,
                                            :email,
                                            :password,
                                            :password_confirmation,
                                            :current_password])
  end
end

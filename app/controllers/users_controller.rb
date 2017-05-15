class UsersController < InheritedResources::Base
  load_and_authorize_resource

  private

    def user_params
      params.require(:user).permit(:name, :gender, :dob, :role_id, :image, :email, :remove_image)
    end

end

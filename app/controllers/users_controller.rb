class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:name, :gender, :dob, :role_id)
    end
end


class RolesController < InheritedResources::Base
  load_and_authorize_resource
  private

    def role_params
      params.require(:role).permit(:name, :description)
    end
end

class PriorityServiceProfilesController < ApplicationController

  def create
    PriorityServiceProfile.create(priority_service_profile_params)
    redirect_to service_profiles_path
  end

  def destroy
    PriorityServiceProfile.find(params[:id]).destroy
    redirect_to service_profiles_path
  end


  def priority_service_profile_params
    params.permit(
      :service_profile_id, :priority_number
    )
  end
end

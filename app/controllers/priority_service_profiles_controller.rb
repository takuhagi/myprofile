class PriorityServiceProfilesController < ApplicationController

  def create
    PriorityServiceProfile.create(priority_service_profile_params)
  end

  def destroy
    PriorityServiceProfile.find(params[:id]).destroy
  end


  def priority_service_profile_params
    params.permit(
      :service_profile_id, :priority_number
    )
  end
end

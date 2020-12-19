class PriorityEventProfilesController < ApplicationController
  def create
    PriorityEventProfile.create(priority_event_profile_params)
  end

  def destroy
    PriorityEventProfile.find(params[:id]).destroy
  end

  def priority_event_profile_params
    params.permit(
      :event_profile_id, :priority_number
    )
  end
end

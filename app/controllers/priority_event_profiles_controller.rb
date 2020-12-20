class PriorityEventProfilesController < ApplicationController
  def create
    PriorityEventProfile.create(priority_event_profile_params)
    redirect_to event_profiles_path
    # redirect_back fallback_location: priority_store_profiles_path
    # redirect_to action: 'index'
  end

  def destroy
    PriorityEventProfile.find(params[:id]).destroy
    # redirect_back fallback_location: priority_store_profiles_path
    redirect_to event_profiles_path
  end

  def priority_event_profile_params
    params.permit(
      :event_profile_id, :priority_number
    )
  end
end

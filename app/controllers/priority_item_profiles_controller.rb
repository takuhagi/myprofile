class PriorityItemProfilesController < ApplicationController
  def create
    PriorityItemProfile.create(priority_item_profile_params)
  end

  def destroy
    PriorityItemProfile.find(params[:id]).destroy
  end

  def priority_item_profile_params
    params.permit(
      :item_profile_id, :priority_number
    )
  end
end

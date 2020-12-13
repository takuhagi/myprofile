class PriorityStoreProfilesController < ApplicationController

  def create
    PriorityStoreProfile.create(priority_store_profile_params)
  end

  def destroy
    PriorityStoreProfile.find(params[:id]).destroy
  end

  private
  def priority_store_profile_params
    params.permit(
      :store_profile_id, :priority_number
    )
  end
end

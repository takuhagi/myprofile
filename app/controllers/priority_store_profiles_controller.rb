class PriorityStoreProfilesController < ApplicationController
  def index
    @counter = 0
    @priority_number_array =[[1,1],[2,2],[3,3],[4,4],[5,5],[6,6]]
    @store_profiles = StoreProfile.all
    @service_profiles = ServiceProfile.all
    @item_profiles = ItemProfile.all
    @event_profiles = EventProfile.all
    
    @store_profiles_select_array = []
    @item_profiles_select_array = []
    @service_profiles_select_array = []
    @event_profiles_select_array = []

    @store_profiles.each do |store_profile|
      @store_profiles_select_array << [store_profile.name, store_profile.id]
    end
    @store_profile_1 =  @store_profiles.where(priority_number: 1)
    
    @service_profiles.each do |service_profile|
      @service_profiles_select_array << [service_profile.name, service_profile.id]
    end

    @item_profiles.each do |item_profile|
      @item_profiles_select_array << [item_profile.name, item_profile.id]
    end

    @event_profiles.each do |event_profile|
      @event_profiles_select_array << [event_profile.title, event_profile.id]
    end


    # eventのカラムが、titleではなくnameなら下が良い
    # array4 = [[@store_profiles, @store_profiles_select_array],
    # [@service_profiles, @service_profiles_select_array],
    # [@item_profiles, @item_profiles_select_array],
    # [@event_profiles, @event_profiles_select_array]]
    #   array4.each do |element|
    #       element[0].each do |each_profile_array|
    #         element[1] << [each_profile_array.name, each_profile_array.id]
    #     end
    #   end
  end

  def create
    if PriorityStoreProfile.create(priority_store_profile_params)
    # redirect_to store_profiles_path
      redirect_to priority_store_profiles_path
    else
      render "index"
    end
  end

  def destroy
    PriorityStoreProfile.find(params[:id]).destroy
    redirect_to store_profiles_path
  end

  private
  def priority_store_profile_params
    params.permit(
      :store_profile_id, :priority_number
    )
  end
end

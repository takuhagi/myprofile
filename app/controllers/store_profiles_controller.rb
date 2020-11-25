class StoreProfilesController < ApplicationController
  def index
    @store_profiles = StoreProfile.all
  end
  def new
    @store_profile = StoreProfile.new
  end
  def create
    @user = User.find(current_user.id)
    @store_profile = StoreProfile.new(store_profile_params)
    if @store_profile.save
      # flash[:success] = "Object successfully created"
      # redirect_to @store_profile
      redirect_to root_path
    else
      # flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  def edit
    @store_profile = StoreProfile.find(params[:id])
  end
  def update
    @store_profile = StoreProfile.find(params[:id])
      if @store_profile.update(store_profile_params)
        # flash[:success] = "Object was successfully updated"
        # redirect_to @store_profile
        redirect_to root_path
      else
        # flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  
  private

  def store_profile_params
    params.require(:store_profile).permit(
      :name,
      :explanation,
      :profile_link,
      :item_link,
      :service_link,
      :event_link,
      store_images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end
  
end

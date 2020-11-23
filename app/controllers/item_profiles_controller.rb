class ItemProfilesController < ApplicationController
  def index
    @item_profiles = ItemProfile.all
  end
  def new
    @item_profile = ItemProfile.new
  end
  def create
    @user = User.find(current_user.id)
    @item_profile = ItemProfile.new(item_profile_params)
    if @item_profile.save
      # flash[:success] = "Object successfully created"
      # redirect_to @item_profile
      redirect_to root_path
    else
      # flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  def edit
    @item_profile = ItemProfile.find(params[:id])
  end
  def update
    @item_profile = ItemProfile.find(params[:id])
      if @item_profile.update(item_profile_params)
        # flash[:success] = "Object was successfully updated"
        # redirect_to @item_profile
        redirect_to root_path
      else
        # flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  
  private

  def item_profile_params
    params.require(:item_profile).permit(
      :name,
      :explanation,
      :profile_link,
      :store_link,
      :service_link,
      :event_link,
      item_images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

end

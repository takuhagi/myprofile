class ItemProfilesController < ApplicationController
  def index
    @item_profiles = ItemProfile.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
    
    num_id1 = PriorityItemProfile.where(priority_number: 1)
    if num_id1[0] != nil
      @priority_item_profile1 = ItemProfile.find(num_id1[0].item_profile_id)
      @priority_item1_user = User.find(@priority_item_profile1.user_id)
    end

    num_id2 = PriorityItemProfile.where(priority_number: 2)
    if num_id2[0]!= nil
      @priority_item_profile2 = ItemProfile.find(num_id2[0].item_profile_id)
      @priority_item2_user = User.find(@priority_item_profile2.user_id)
    end

    num_id3 = PriorityItemProfile.where(priority_number: 3)
    if num_id3[0]!= nil
      @priority_item_profile3 = ItemProfile.find(num_id3[0].item_profile_id)
      @priority_item3_user = User.find(@priority_item_profile3.user_id)
    end

    num_id4 = PriorityItemProfile.where(priority_number: 4)
    if num_id4[0]!= nil
      @priority_item_profile4 = ItemProfile.find(num_id4[0].item_profile_id)
      @priority_item4_user = User.find(@priority_item_profile4.user_id)
    end

    num_id5 = PriorityItemProfile.where(priority_number: 5)
    if num_id5[0]!= nil
      @priority_item_profile5 = ItemProfile.find(num_id5[0].item_profile_id)
      @priority_item5_user = User.find(@priority_item_profile5.user_id)
    end

    num_id6 = PriorityItemProfile.where(priority_number: 6)
    if num_id6[0]!= nil
      @priority_item_profile6 = ItemProfile.find(num_id6[0].item_profile_id)
      @priority_item6_user = User.find(@priority_item_profile6.user_id)
    end
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
  def show
    @item_profile = ItemProfile.find(params[:id])
  end
  def destroy
    @item_profile = ItemProfile.find(params[:id])
    if @item_profile.destroy
      # flash[:success] = 'ItemProfile was successfully deleted.'
      redirect_to item_profiles_url
    else
      # flash[:error] = 'Something went wrong'
      redirect_to item_profiles_url
    end
  end

  
  private

  def item_profile_params
    params.require(:item_profile).permit(
      :name,
      :explanation,
      :image,
      :remove_image,
      :profile_link,
      :store_link,
      :service_link,
      :event_link,
      item_images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

end

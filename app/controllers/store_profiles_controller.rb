class StoreProfilesController < ApplicationController

  before_action :correct_user, only: [:edit]
  def index

    if params[:q].present?
      @q = StoreProfile.ransack(params[:q])
      @store_profiles = @q.result.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
      num_id1 = PriorityStoreProfile.where(priority_number: 1)
      if num_id1[0] != nil
        @priority_store_profile1 = StoreProfile.find(num_id1[0].store_profile_id)
        @priority_store1_user = User.find(@priority_store_profile1.user_id)
      end
  
      num_id2 = PriorityStoreProfile.where(priority_number: 2)
      if num_id2[0]!= nil
        @priority_store_profile2 = StoreProfile.find(num_id2[0].store_profile_id)
        @priority_store2_user = User.find(@priority_store_profile2.user_id)
      end
  
      num_id3 = PriorityStoreProfile.where(priority_number: 3)
      if num_id3[0]!= nil
        @priority_store_profile3 = StoreProfile.find(num_id3[0].store_profile_id)
        @priority_store3_user = User.find(@priority_store_profile3.user_id)
      end
  
      num_id4 = PriorityStoreProfile.where(priority_number: 4)
      if num_id4[0]!= nil
        @priority_store_profile4 = StoreProfile.find(num_id4[0].store_profile_id)
        @priority_store4_user = User.find(@priority_store_profile4.user_id)
      end
  
      num_id5 = PriorityStoreProfile.where(priority_number: 5)
      if num_id5[0]!= nil
        @priority_store_profile5 = StoreProfile.find(num_id5[0].store_profile_id)
        @priority_store5_user = User.find(@priority_store_profile5.user_id)
      end
  
      num_id6 = PriorityStoreProfile.where(priority_number: 6)
      if num_id6[0]!= nil
        @priority_store_profile6 = StoreProfile.find(num_id6[0].store_profile_id)
        @priority_store6_user = User.find(@priority_store_profile6.user_id)
      end

      num_id7 = PriorityStoreProfile.where(priority_number: 7)
      if num_id7[0]!= nil
        @priority_store_profile7 = StoreProfile.find(num_id7[0].store_profile_id)
        @priority_store7_user = User.find(@priority_store_profile7.user_id)
      end

      num_id8 = PriorityStoreProfile.where(priority_number: 8)
      if num_id8[0]!= nil
        @priority_store_profile8 = StoreProfile.find(num_id8[0].store_profile_id)
        @priority_store8_user = User.find(@priority_store_profile8.user_id)
      end

    else
      params[:q] = { sorts: 'updated_at desc' }
      @q = StoreProfile.ransack(params[:q])
      @store_profiles = @q.result.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
      num_id1 = PriorityStoreProfile.where(priority_number: 1)
      if num_id1[0] != nil
        @priority_store_profile1 = StoreProfile.find(num_id1[0].store_profile_id)
        @priority_store1_user = User.find(@priority_store_profile1.user_id)
      end
  
      num_id2 = PriorityStoreProfile.where(priority_number: 2)
      if num_id2[0]!= nil
        @priority_store_profile2 = StoreProfile.find(num_id2[0].store_profile_id)
        @priority_store2_user = User.find(@priority_store_profile2.user_id)
      end
  
      num_id3 = PriorityStoreProfile.where(priority_number: 3)
      if num_id3[0]!= nil
        @priority_store_profile3 = StoreProfile.find(num_id3[0].store_profile_id)
        @priority_store3_user = User.find(@priority_store_profile3.user_id)
      end
  
      num_id4 = PriorityStoreProfile.where(priority_number: 4)
      if num_id4[0]!= nil
        @priority_store_profile4 = StoreProfile.find(num_id4[0].store_profile_id)
        @priority_store4_user = User.find(@priority_store_profile4.user_id)
      end
  
      num_id5 = PriorityStoreProfile.where(priority_number: 5)
      if num_id5[0]!= nil
        @priority_store_profile5 = StoreProfile.find(num_id5[0].store_profile_id)
        @priority_store5_user = User.find(@priority_store_profile5.user_id)
      end
  
      num_id6 = PriorityStoreProfile.where(priority_number: 6)
      if num_id6[0]!= nil
        @priority_store_profile6 = StoreProfile.find(num_id6[0].store_profile_id)
        @priority_store6_user = User.find(@priority_store_profile6.user_id)
      end

      num_id7 = PriorityStoreProfile.where(priority_number: 7)
      if num_id7[0]!= nil
        @priority_store_profile7 = StoreProfile.find(num_id7[0].store_profile_id)
        @priority_store7_user = User.find(@priority_store_profile7.user_id)
      end

      num_id8 = PriorityStoreProfile.where(priority_number: 8)
      if num_id8[0]!= nil
        @priority_store_profile8 = StoreProfile.find(num_id8[0].store_profile_id)
        @priority_store8_user = User.find(@priority_store_profile8.user_id)
      end

    end

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
  def show
    @store_profile = StoreProfile.find(params[:id])
  end
  def destroy
    @store_profile = StoreProfile.find(params[:id])
    if @store_profile.destroy
      # flash[:success] = 'StoreProfile was successfully deleted.'
      redirect_to store_profiles_url
    else
      # flash[:error] = 'Something went wrong'
      redirect_to store_profiles_url
    end
  end
  
  
  private

  def store_profile_params
    params.require(:store_profile).permit(
      :name,
      :explanation,
      :image,
      :remove_image,
      :profile_link,
      :item_link,
      :service_link,
      :event_link,
      store_images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end
  
  def correct_user
    @store = StoreProfile.find(params[:id])
    if @store.user != current_user
      redirect_to root_path
    end
  end
end

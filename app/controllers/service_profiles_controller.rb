class ServiceProfilesController < ApplicationController
  def index
    @service_profiles = ServiceProfile.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)

    num_id1 = PriorityServiceProfile.where(priority_number: 1)
    if num_id1[0] != nil
      @priority_service_profile1 = ServiceProfile.find(num_id1[0].service_profile_id)
      @priority_service1_user = User.find(@priority_service_profile1.user_id)
    end

    num_id2 = PriorityServiceProfile.where(priority_number: 2)
    if num_id2[0]!= nil
      @priority_service_profile2 = ServiceProfile.find(num_id2[0].service_profile_id)
      @priority_service2_user = User.find(@priority_service_profile2.user_id)
    end

    num_id3 = PriorityServiceProfile.where(priority_number: 3)
    if num_id3[0]!= nil
      @priority_service_profile3 = ServiceProfile.find(num_id3[0].service_profile_id)
      @priority_service3_user = User.find(@priority_service_profile3.user_id)
    end

    num_id4 = PriorityServiceProfile.where(priority_number: 4)
    if num_id4[0]!= nil
      @priority_service_profile4 = ServiceProfile.find(num_id4[0].service_profile_id)
      @priority_service4_user = User.find(@priority_service_profile4.user_id)
    end

    num_id5 = PriorityServiceProfile.where(priority_number: 5)
    if num_id5[0]!= nil
      @priority_service_profile5 = ServiceProfile.find(num_id5[0].service_profile_id)
      @priority_service5_user = User.find(@priority_service_profile5.user_id)
    end

    num_id6 = PriorityServiceProfile.where(priority_number: 6)
    if num_id6[0]!= nil
      @priority_service_profile6 = ServiceProfile.find(num_id6[0].service_profile_id)
      @priority_service6_user = User.find(@priority_service_profile6.user_id)
    end
  end

  def new
    @service_profile = ServiceProfile.new
  end
  def create
    @user = User.find(current_user.id)
    @service_profile = ServiceProfile.new(service_profile_params)
    if @service_profile.save
      # flash[:success] = "Object successfully created"
      # redirect_to @service_profile
      redirect_to root_path
    else
      # flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  def edit
    @service_profile = ServiceProfile.find(params[:id])
  end
  def update
    @service_profile = ServiceProfile.find(params[:id])
      if @service_profile.update(service_profile_params)
        # flash[:success] = "Object was successfully updated"
        # redirect_to @service_profile
        redirect_to root_path
      else
        # flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  def show
    @service_profile = ServiceProfile.find(params[:id])
  end
  def destroy
    @service_profile = ServiceProfile.find(params[:id])
    if @service_profile.destroy
      # flash[:success] = 'ServiceProfile was successfully deleted.'
      redirect_to service_profiles_url
    else
      # flash[:error] = 'Something went wrong'
      redirect_to service_profiles_url
    end
  end
  
  
  
  private

  def service_profile_params
    params.require(:service_profile).permit(
      :name,
      :explanation,
      :image,
      :remove_image,
      :profile_link,
      :store_link,
      :item_link,
      :event_link,
      service_images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end
end

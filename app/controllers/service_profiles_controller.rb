class ServiceProfilesController < ApplicationController
  def index
    @service_profiles = ServiceProfile.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
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

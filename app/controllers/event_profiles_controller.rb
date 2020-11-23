class EventProfilesController < ApplicationController
  def index
    @event_profiles = EventProfile.all
  end
  def new
    @event_profile = EventProfile.new
  end
  def create
    @user = User.find(current_user.id)
    @event_profile = EventProfile.new(event_profile_params)
    if @event_profile.save
      # flash[:success] = "Object successfully created"
      # redirect_to @event_profile
      redirect_to root_path
    else
      # flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  def edit
    @event_profile = EventProfile.find(params[:id])
  end
  def update
    @event_profile = EventProfile.find(params[:id])
      if @event_profile.update(event_profile_params)
        # flash[:success] = "Object was successfully updated"
        # redirect_to @event_profile
        redirect_to root_path
      else
        # flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  
  private

  def event_profile_params
    params.require(:event_profile).permit(
      :title,
      :explanation,
      :prefecture,
      :city,
      :prace,
      :start,
      :end,
      :profile_link,
      :store_link,
      :item_link,
      :service_link
    ).merge(user_id: current_user.id)
  end

end

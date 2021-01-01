class EventProfilesController < ApplicationController
  def index

    if params[:q].present?
      @q = EventProfile.ransack(params[:q])
      @event_profiles = @q.result.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
      
      num_id1 = PriorityEventProfile.where(priority_number: 1)
      if num_id1[0] != nil
        @priority_event_profile1 = EventProfile.find(num_id1[0].event_profile_id)
        @priority_event1_user = User.find(@priority_event_profile1.user_id)
      end
  
      num_id2 = PriorityEventProfile.where(priority_number: 2)
      if num_id2[0]!= nil
        @priority_event_profile2 = EventProfile.find(num_id2[0].event_profile_id)
        @priority_event2_user = User.find(@priority_event_profile2.user_id)
      end
  
      num_id3 = PriorityEventProfile.where(priority_number: 3)
      if num_id3[0]!= nil
        @priority_event_profile3 = EventProfile.find(num_id3[0].event_profile_id)
        @priority_event3_user = User.find(@priority_event_profile3.user_id)
      end
  
      num_id4 = PriorityEventProfile.where(priority_number: 4)
      if num_id4[0]!= nil
        @priority_event_profile4 = EventProfile.find(num_id4[0].event_profile_id)
        @priority_event4_user = User.find(@priority_event_profile4.user_id)
      end
  
      num_id5 = PriorityEventProfile.where(priority_number: 5)
      if num_id5[0]!= nil
        @priority_event_profile5 = EventProfile.find(num_id5[0].event_profile_id)
        @priority_event5_user = User.find(@priority_event_profile5.user_id)
      end
  
      num_id6 = PriorityEventProfile.where(priority_number: 6)
      if num_id6[0]!= nil
        @priority_event_profile6 = EventProfile.find(num_id6[0].event_profile_id)
        @priority_event6_user = User.find(@priority_event_profile6.user_id)
      end

    else
      params[:q] = { sorts: 'updated_at desc' }
      @q = EventProfile.ransack(params[:q])
      @event_profiles = EventProfile.includes(:user).order(updated_at: :DESC).page(params[:page]).per(9)
      
      num_id1 = PriorityEventProfile.where(priority_number: 1)
      if num_id1[0] != nil
        @priority_event_profile1 = EventProfile.find(num_id1[0].event_profile_id)
        @priority_event1_user = User.find(@priority_event_profile1.user_id)
      end
  
      num_id2 = PriorityEventProfile.where(priority_number: 2)
      if num_id2[0]!= nil
        @priority_event_profile2 = EventProfile.find(num_id2[0].event_profile_id)
        @priority_event2_user = User.find(@priority_event_profile2.user_id)
      end
  
      num_id3 = PriorityEventProfile.where(priority_number: 3)
      if num_id3[0]!= nil
        @priority_event_profile3 = EventProfile.find(num_id3[0].event_profile_id)
        @priority_event3_user = User.find(@priority_event_profile3.user_id)
      end
  
      num_id4 = PriorityEventProfile.where(priority_number: 4)
      if num_id4[0]!= nil
        @priority_event_profile4 = EventProfile.find(num_id4[0].event_profile_id)
        @priority_event4_user = User.find(@priority_event_profile4.user_id)
      end
  
      num_id5 = PriorityEventProfile.where(priority_number: 5)
      if num_id5[0]!= nil
        @priority_event_profile5 = EventProfile.find(num_id5[0].event_profile_id)
        @priority_event5_user = User.find(@priority_event_profile5.user_id)
      end
  
      num_id6 = PriorityEventProfile.where(priority_number: 6)
      if num_id6[0]!= nil
        @priority_event_profile6 = EventProfile.find(num_id6[0].event_profile_id)
        @priority_event6_user = User.find(@priority_event_profile6.user_id)
      end

    end

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
  def show
    @event_profile = EventProfile.find(params[:id])
  end
  def destroy
    @event_profile = EventProfile.find(params[:id])
    if @event_profile.destroy
      # flash[:success] = 'EventProfile was successfully deleted.'
      redirect_to event_profiles_url
    else
      # flash[:error] = 'Something went wrong'
      redirect_to event_profiles_url
    end
  end
  
  
  private

  def event_profile_params
    params.require(:event_profile).permit(
      :title,
      :explanation,
      :image,
      :remove_image,
      :prefecture,
      :city,
      :prace,
      :start,
      :end,
      :profile_link,
      :store_link,
      :item_link,
      :service_link,
      event_images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end
end

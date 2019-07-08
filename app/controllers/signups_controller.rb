class SignupsController < ApplicationController
  layout 'application-off'
  def index
  end

  def new
  end

  def show
  end

  def address
  end

  def complete
  end

  def sms_authenticate
    @profile=current_user.profile.assign_attributes(profile_params)
    if  current_user.profile.valid?(:sms_send)
      current_user.profile.update(profile_params)
    else
      @profile=Profile.new
      @errors='未記入の箇所があります。'
      render 'sms_send'
    end
    
  end

  def sms_send
    @profile=Profile.new
    flash.delete(:notice)
  end

  def address_create
    @profile=current_user.profile.assign_attributes(profile_params)
    if current_user.profile.valid?(:value)
      current_user.profile.update(profile_params)
      redirect_to new_user_card_path(current_user.id)
    else
      @profile=current_user.profile
      @errors='未記入の箇所があります。'
      render 'address'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:phone_number,:first_name, :last_name, :first_name_kana, :last_name_kana, :postalcode, :prefecture, :city, :street_number,:building_name)
  end

  def use_check_address_nil?
    false
  end
end

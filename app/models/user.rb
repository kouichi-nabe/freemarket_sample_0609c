class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :card, dependent: :destroy
  accepts_nested_attributes_for :card
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])[a-z\d]+\z/i }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true

  def self.profile_with_user_is_valid?(params)
    params[:user][:profile_attributes][:first_name].present?\
    && params[:user][:profile_attributes][:last_name].present?\
    && params[:user][:profile_attributes][:first_name_kana].present?\
    && params[:user][:profile_attributes][:last_name_kana].present?\
    && params[:user][:profile_attributes][:'brithday(1i)'].present?\
    && params[:user][:profile_attributes][:'brithday(2i)'].present?\
    && params[:user][:profile_attributes][:'brithday(3i)'].present?
  end

  def self.from_omniauth(auth)
    @credential = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    @user = User.where(email:auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = Devise.friendly_token[0,20] 
      end
    @user
  end

end

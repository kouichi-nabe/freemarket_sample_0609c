require 'rails_helper'

describe User do
  describe '#create' do

    # email無しの場合
    it "is invalid without a email" do
      user = build(:user, email: " ")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # password無しの場合
    it "is invalid without a password" do
      user = build(:user, password: " ")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # password有り、password_confirmation無しの場合
    it "is invalid without a password_confirmation if password exist" do
      user = build(:user, password_confirmation: " ")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    # nickname無しの場合
    it "is invalid without a nickname" do
      user = build(:user, nickname: " ")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # email重複確認
    it "is invalid with duplicate email" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # パスワード文字数確認（6文字）
    it "is valid with password over 6 letters" do
      user = build(:user, password: "1234abcd", password_confirmation: "1234abcd")
      expect(user).to be_valid
    end

    # パスワード文字数確認（5文字以下）
    it "is invalid with password less than 5 letters" do
      user = build(:user, password: "1234a", password_confirmation: "1234a")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    # 数字だけのパスワード
    it "is invalid with password only integer" do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:password]).to include("is only number invalid")
    end

    # nickname,email,passwordの入力確認
    it "is valid with a nickname,email,password" do
      user = build(:user)
      expect(user).to be_valid
    end

  end
end
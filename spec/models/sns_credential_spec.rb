require 'rails_helper'

describe SnsCredential do
  describe '#create' do
    # uid,providerの確認（値が存在する）
    it "is valid with a provider,uid" do
      sns_credential = build(:sns_credential)
      expect(sns_credential).to be_valid
    end
    
    # uidの確認（uidが無い）
    it "is invalid without a uid" do
      sns_credential = build(:sns_credential, uid: " ")
      sns_credential.valid?
      expect(sns_credential.errors[:uid]).to include("を入力してください")
    end

    # providerの確認(providerが無い)
    it "is invalid without a provider" do
      sns_credential = build(:sns_credential, provider: " ")
      sns_credential.valid?
      expect(sns_credential.errors[:provider]).to include("を入力してください")
    end

  end
end

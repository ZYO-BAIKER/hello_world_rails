require 'rails_helper'

RSpec.describe User, type: :model do
  context "accountを指定しているとき" do
    it "ユーザーが作られる" do
      #binding.pry
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end

  context "accountを指定していいないとき" do
    it "ユーザー作成失敗" do
      user = build(:user) # FactoryBotの記述を省略
      user[:account]=nil
      expect(user).to be_invalid
      expect(user.errors.details[:account][0][:error]).to eq :blank
    end
  end

  # context "まだ同じ名前のaccountが存在していないとき" do
  #   it "ユーザーが作られる" do
  #     user = FactoryBot.create(:user)
  #     expect(user).to be_valid
  #   end
  # end

  context "既に同じ名前のaccountが存在しているとき" do
    before {create(:user,account:"abs")}
    fit "ユーザー作成失敗" do
      user = build(:user,account:"abs")
      expect(user).to be_invalid
      expect(user.errors.details[:account][0][:error]).to eq :taken
    end
  end

end

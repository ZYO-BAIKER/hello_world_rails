require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject { get(users_path) }
    before {create_list(:user,3)}

    fit "ユーザーの一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res.first.keys).to eq ["account", "name", "email"]
      expect(response).to have_http_status(200)
      expect(response.status).to eq 200
    end
  end

  describe "GET /users/:id" do
    before {user = create(:user)}
    subject { get(users_path(user)) }
    it "特定のユーザーのレコードが取得できる" do
      subject
      #binding.pry
    end
  end

  describe "POST /users" do
    it "ユーザーのレコードが作成できる" do

    end
  end

  describe "PATCH(PUT) /users/:id" do
    it "特定のユーザーのレコードを更新できる" do

    end
  end

  describe "DELETE /users/:id" do
    it "特定のユーザーのレコードを削除する" do

    end
  end
end

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "ユーザーの一覧が取得できる" do
      get users_path

    end
  end

  describe "GET /users/:id" do
    it "特定のユーザーのiレコードが取得できる" do

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

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject { get(users_path) }
    before {create_list(:user,user_count)}
    let(:user_count) {3}

    it "ユーザーの一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res.length).to eq user_count
      expect(res.first.keys).to eq ["account", "name", "email"]
      expect(response).to have_http_status(200)
      expect(response.status).to eq 200
    end
  end

  describe "GET /users/:id" do
    subject { get(user_path(user_id)) }

    context "指定したidのユーザーが存在する場合" do
      let(:user_id) { user.id }
      let(:user) { create(:user) }

      it "特定のユーザーのレコードが取得できる" do
        subject
        res = JSON.parse(response.body)
        expect(response.status).to eq 200

        expect(res["account"]).to eq user.account
        expect(res["name"]).to eq user.name
        expect(res["email"]).to eq user.email
      end
    end

    context "指定したidのユーザーが存在しないとき" do
      let(:user_id){ 14234 }
      it "ユーザーが見つからない" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "POST /users" do
    subject { post(users_path, params:params) }

    context "適切なパラメーターを送信したとき" do
      let(:params) do
        { user: attributes_for(:user) }
      end
      fit "ユーザーのレコードが1つ作成される" do
        expect { subject }.to change { User.count }.by(1)
        res = JSON.parse(response.body)
        expect(res["name"]).to eq params[:user][:name]
        expect(res["account"]).to eq params[:user][:account]
        expect(res["email"]).to eq params[:user][:email]
        expect(response.status).to eq 200
      end
    end
    context "不適切なパラメーターを送信したとき" do
      let(:params) { attributes_for(:user) }
      fit "エラーする" do
        expect { subject }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe "PATCH(PUT) /users/:id" do
    subject { patch(user_path(user_id),params: params)}

    let(:params) { user: { name: Faker::Name.name, created_at: 1.day.ago } }
    let(:user_id) { user.id }
    let(:user) { create(:user) }

    it "特定のユーザーのレコードを更新できる" do
      expect {subject}.to change {user.reload.name}.from(user.name).to(params[:user][:name]) &
                          not_change {user.reload.account} &
                          not_change {user.reload.email} &
                          not_change {user.reload.created_at}
    end
  end

  describe "DELETE /users/:id" do
    it "特定のユーザーのレコードを削除する" do
    end
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show,:update,:destroy]

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(params[:user])
    ## インスタンスを DB に保存する
    @user.save!
    ## json として値を返す
    render :show
  end

  def update
    # 探してきたレコードに対して変更を行う
    @user.update!(user_params)
    # json として値を返す
    render :show
  end

  def destroy
    @user.destroy!
    render :show # json として値を返す
  end

  private
  def set_user
    @user = User.find(params[:id]) # 対象のレコードを探す
  end

  def user_params
    params.require(:user).permit(:name,:account,:email)
  end
end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params_user)
    if @user.save 
      # success
      # 一回だけ表示してくれる。更新すると（２回め以降は消える）
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
      #GET + /users/:id
    else
      # false
      render "new"
    end
  end
  
  private
  
    def params_user
      params.require(:user).permit(
        :name, 
        :email, 
        :password, 
        :password_confirmation)
    end
end

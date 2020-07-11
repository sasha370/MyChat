class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "Пользователь успешно создан"
      session[:user_id] = @user.id
      redirect_to chatroom_path
    else
      # если сохранение неудачно, то открываем шаблон NEW ? который подсасывает форму, в которой есть Errors
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
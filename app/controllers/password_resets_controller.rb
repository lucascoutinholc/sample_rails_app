class PasswordResetsController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)

    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "O link de alteração da senha foi enviado para o email informado."
      redirect_to root_url
    else
      flash.now[:danger] = "O email informado não foi encontrado na base de dados."
      render "new", status: :unprocessable_entity
    end
  end

  def update
  end
end

class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

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
    if params[:user][:password].empty?
      @user.errors.add(:password, "não pode ser vazio.")
      render "edit", status: :unprocessable_entity
    elsif @user.update(user_params)
      @user.forget
      reset_session
      log_in @user
      flash[:success] = "A senha foi redefinida com sucesso."
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user && 
           @user.activated? && 
           @user.authenticated?(:reset, params[:id])

        ## 28/12/2024 - PAREI AQUI, ainda não resolvi o "problema".
        ## O reset_digest não é igual ao params[:id].
        ## Por isso o método valid_user está redirecionando
          ## para o localhost:3000
        ## E eu não entendo o pq disso está acontecendo.

        ## 29/12/2024 - Descobri qual era o problema!
        ## O nome da coluna que recebia o datetime do
          ## pedido de reset, estava errado; reset_send_at,
          ## mas na verdade, o nome correto era:
          ## reset_sent_at

      redirect_to root_url
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "O link de redefinição de senha expirou."
      redirect_to new_password_reset_url
    end
  end
end

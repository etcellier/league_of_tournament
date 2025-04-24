class UsersController < ApplicationController
  before_action :require_admin, except: [:new, :create]
  
  def new
    # Si vous voulez limiter la création de comptes, vous pouvez ajouter:
    # redirect_to root_path, alert: 'Non autorisé' unless User.none?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Premier utilisateur est automatiquement admin
    @user.admin = true if User.none?
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Compte créé avec succès!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
  def require_admin
    redirect_to root_path, alert: 'Accès réservé aux administrateurs' unless current_user&.admin?
  end
end
class AccessController < ApplicationController
  def login
  end

  def attempt_login
    # se ambos os parametros estiverem presentes
    if params[:username].present? && params[:password].present?
      # Primeiro tenta localizar um Admin
      found_user = Student.where(:username => params[:username]).first
      if found_user # se localizado um Admin
        # tenta realizar a autenticação do Admin
        authorized_user = found_user.authenticate(params[:password])
        admin = false
      elsif
        found_user = User.where(:username => params[:username]).first
        if found_user
          authorized_user = found_user.authenticate(params[:password])
          admin = found_user.admin
        end
      end
    end


    # se usuario autorizado existir
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:user] = found_user
      session[:admin] = admin
      flash[:success] = 'Login realizado'
      case session[:admin]
        when true

          redirect_to root_path
        else
          redirect_to member_path
      end
    else # Caso não encontre um usuario autorizado
      flash[:warning] = 'Combinação de username/password inválida'
      render('login')
    end
  end


  def logout
    session[:user_id] = nil
    session[:user] = nil
    session[:admin] = nil
    flash[:info] = 'Logged out'
    redirect_to root_path
  end
end

class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /users
  # GET /users.json
  def index
    @users = User.page(params[:page])
    authorize! :read, User

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    authorize! :create, @user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    authorize! :create, @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: I18n.t('controllers.users.user_was_successfully_created') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    authorize! :update, @user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        if current_user.admin?
          format.html { redirect_to users_url, notice: I18n.t('controllers.users.user_was_successfully_updated') }
        else
          format.html { redirect_to edit_user_url(@user), notice: I18n.t('controllers.users.user_was_successfully_updated') }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

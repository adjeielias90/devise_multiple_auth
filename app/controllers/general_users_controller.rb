class GeneralUsersController < ApplicationController
  before_action :set_general_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /general_users
  # GET /general_users.json
  def index
    @general_users = GeneralUser.all
  end

  # GET /general_users/1
  # GET /general_users/1.json
  def show
  end

  # GET /general_users/new
  def new
    @general_user = GeneralUser.new
  end

  # GET /general_users/1/edit
  def edit
  end

  # POST /general_users
  # POST /general_users.json
  def create
    @general_user = GeneralUser.new(general_user_params)

    respond_to do |format|
      if @general_user.save && @general_user.provider.code == 100

        @ldap_login = @general_user.ldap_users.new(ldap_user_params)
        if @ldap_login.save
          format.html { redirect_to new_ldap_user_session_path(:general_user_id => @general_user.id) }
          format.json { render :show, status: :created, location: @general_user }
        else
          format.html { redirect_to new_general_user_path }
        end

      else

        if @general_user.save && @general_user.provider.code == 200
          @ldap_login = @general_user.radius_users.new(ldap_user_params)
          if @ldap_login.save
            format.html { redirect_to new_radius_user_session_path(:general_user_id => @general_user.id) }
            format.json { render :show, status: :created, location: @general_user }
          else
            format.html { redirect_to new_general_user_path }
          end
        end

      else

        if @general_user.save && @general_user.provider.code == 300
        end

      else
        format.html { render :new }
        format.json { render json: @general_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_users/1
  # PATCH/PUT /general_users/1.json
  def update
    respond_to do |format|
      if @general_user.update(general_user_params)
        format.html { redirect_to @general_user, notice: 'General user was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_user }
      else
        format.html { render :edit }
        format.json { render json: @general_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_users/1
  # DELETE /general_users/1.json
  def destroy
    @general_user.destroy
    respond_to do |format|
      format.html { redirect_to general_users_url, notice: 'General user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_user
      @general_user = GeneralUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_user_params
      params.require(:general_user).permit(:email, :provider_id, :password, :username)
    end

    def ldap_user_params
      params.require(:general_user).permit(:username, :password, :general_user_id)
    end

    def radius_user_params
      params.require(:general_user).permit(:username, :password, :general_user_id)
    end
end

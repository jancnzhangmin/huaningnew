class ShowusersController < ApplicationController
  before_action :set_showuser, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @showusers = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @showuser = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @showuser = User.new(showuser_params)

    respond_to do |format|
      if @showuser.save
        format.html { redirect_to @showuser, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @showuser }
      else
        format.html { render :new }
        format.json { render json: @showuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @showuser.update(showuser_params)
        format.html { redirect_to @showuser, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @showuser }
      else
        format.html { render :edit }
        format.json { render json: @showuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @showuser.destroy
    respond_to do |format|
      format.html { redirect_to showusers_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_showuser
    @showuser = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def showuser_params
    params.require(:user).permit(:name, :password_digest, :tel, :vcode)
  end
end


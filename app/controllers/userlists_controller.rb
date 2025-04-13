class UserlistsController < ApplicationController
  before_action :set_userlist, only: %i[ show edit update destroy ]

  # GET /userlists or /userlists.json
  def index
    @pagy, @userlists = pagy(Userlist.all)
  end

  # GET /userlists/1 or /userlists/1.json
  def show
  end

  # GET /userlists/new
  def new
    @userlist = Userlist.new
  end

  # GET /userlists/1/edit
  def edit
  end

  # POST /userlists or /userlists.json
  def create
    @userlist = Userlist.new(userlist_params)

    respond_to do |format|
      if @userlist.save
        format.html { redirect_to @userlist, notice: "Userlist was successfully created." }
        format.json { render :show, status: :created, location: @userlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userlists/1 or /userlists/1.json
  def update
    respond_to do |format|
      if @userlist.update(userlist_params)
        format.html { redirect_to @userlist, notice: "Userlist was successfully updated." }
        format.json { render :show, status: :ok, location: @userlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userlists/1 or /userlists/1.json
  def destroy
    @userlist.destroy!

    respond_to do |format|
      format.html { redirect_to userlists_path, status: :see_other, notice: "Userlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userlist
      @userlist = Userlist.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def userlist_params
      params.expect(userlist: [ :username, :email, :address ])
    end
end

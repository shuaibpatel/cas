class VdsController < ApplicationController
  before_action :set_vd, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "admin"
 before_filter :restrict_access
  # GET /vds
  # GET /vds.json
  def index
    @vds = Vd.all
  end

  # GET /vds/1
  # GET /vds/1.json
  def show
  end

  # GET /vds/new
  def new
    @vd = Vd.new
  end

  # GET /vds/1/edit
  def edit
  end

  # POST /vds
  # POST /vds.json
  def create
    @vd = Vd.new(vd_params)

    respond_to do |format|
      if @vd.save
        format.html { redirect_to @vd, notice: 'Vd was successfully created.' }
        format.json { render :show, status: :created, location: @vd }
      else
        format.html { render :new }
        format.json { render json: @vd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vds/1
  # PATCH/PUT /vds/1.json
  def update
    respond_to do |format|
      if @vd.update(vd_params)
        format.html { redirect_to @vd, notice: 'Vd was successfully updated.' }
        format.json { render :show, status: :ok, location: @vd }
      else
        format.html { render :edit }
        format.json { render json: @vd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vds/1
  # DELETE /vds/1.json
  def destroy
    @vd.destroy
    respond_to do |format|
      format.html { redirect_to vds_url, notice: 'Vd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vd
      @vd = Vd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vd_params
      params.require(:vd).permit(:name, :email)
    end

    private
      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end
    end
    
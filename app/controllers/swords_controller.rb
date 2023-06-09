class SwordsController < ApplicationController
  before_action :set_sword, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy]
  # GET /swords or /swords.json
  def index
    @swords = Sword.all
  end

  # GET /swords/1 or /swords/1.json
  def show
  end

  # GET /swords/new
  def new
    @sword = Sword.new
  end

  # GET /swords/1/edit
  def edit
  end

  # POST /swords or /swords.json
  def create
    @sword = Sword.new(sword_params)

    respond_to do |format|
      if @sword.save
        format.html { redirect_to sword_url(@sword), notice: "Sword was successfully created." }
        format.json { render :show, status: :created, location: @sword }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swords/1 or /swords/1.json
  def update
    respond_to do |format|
      if @sword.update(sword_params)
        format.html { redirect_to sword_url(@sword), notice: "Sword was successfully updated." }
        format.json { render :show, status: :ok, location: @sword }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swords/1 or /swords/1.json
  def destroy
    @sword.destroy

    respond_to do |format|
      format.html { redirect_to swords_url, notice: "Sword was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sword
      @sword = Sword.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sword_params
      params.require(:sword).permit(:type, :subtype, :pommel, :grip, :steel, :description)
    end
end

class KitScalesController < ApplicationController
  before_action :set_kit_scale, only: %i[ show edit update destroy ]

  # GET /kit_scales or /kit_scales.json
  def index
    @kit_scales = KitScale.all
  end

  # GET /kit_scales/1 or /kit_scales/1.json
  def show
  end

  # GET /kit_scales/new
  def new
    @kit_scale = KitScale.new
  end

  # GET /kit_scales/1/edit
  def edit
  end

  # POST /kit_scales or /kit_scales.json
  def create
    @kit_scale = KitScale.new(kit_scale_params)

    respond_to do |format|
      if @kit_scale.save
        format.html { redirect_to kit_scale_url(@kit_scale), notice: "Kit scale was successfully created." }
        format.json { render :show, status: :created, location: @kit_scale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kit_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kit_scales/1 or /kit_scales/1.json
  def update
    respond_to do |format|
      if @kit_scale.update(kit_scale_params)
        format.html { redirect_to kit_scale_url(@kit_scale), notice: "Kit scale was successfully updated." }
        format.json { render :show, status: :ok, location: @kit_scale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kit_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kit_scales/1 or /kit_scales/1.json
  def destroy
    @kit_scale.destroy

    respond_to do |format|
      format.html { redirect_to kit_scales_url, notice: "Kit scale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit_scale
      @kit_scale = KitScale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kit_scale_params
      params.fetch(:kit_scale, {})
    end
end

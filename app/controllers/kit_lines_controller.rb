class KitLinesController < ApplicationController
  before_action :set_kit_line, only: %i[ show edit update destroy ]

  # GET /kit_lines or /kit_lines.json
  def index
    @kit_lines = KitLine.all
  end

  # GET /kit_lines/1 or /kit_lines/1.json
  def show
  end

  # GET /kit_lines/new
  def new
    @kit_line = KitLine.new
  end

  # GET /kit_lines/1/edit
  def edit
  end

  # POST /kit_lines or /kit_lines.json
  def create
    @kit_line = KitLine.new(kit_line_params)

    respond_to do |format|
      if @kit_line.save
        format.html { redirect_to kit_line_url(@kit_line), notice: "Kit line was successfully created." }
        format.json { render :show, status: :created, location: @kit_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kit_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kit_lines/1 or /kit_lines/1.json
  def update
    respond_to do |format|
      if @kit_line.update(kit_line_params)
        format.html { redirect_to kit_line_url(@kit_line), notice: "Kit line was successfully updated." }
        format.json { render :show, status: :ok, location: @kit_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kit_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kit_lines/1 or /kit_lines/1.json
  def destroy
    @kit_line.destroy

    respond_to do |format|
      format.html { redirect_to kit_lines_url, notice: "Kit line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit_line
      @kit_line = KitLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kit_line_params
      params.fetch(:kit_line, {})
    end
end

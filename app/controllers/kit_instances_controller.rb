class KitInstancesController < ApplicationController
  before_action :set_kit_instance, only: %i[ update destroy ]

  # POST /kit_instances or /kit_instances.json
  def create
    @kit_instance = KitInstance.new(kit_instance_params)

    respond_to do |format|
      if @kit_instance.save
        format.html { redirect_to kit_url(@kit_instance.kit), notice: "Kit instance was successfully created." }
        format.json { render :show, status: :created, location: @kit_instance }
      else
        format.html do
          @kit = @kit_instance.kit
          render 'kits/show', status: :unprocessable_entity
        end
        format.json { render json: @kit_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kit_instances/1 or /kit_instances/1.json
  def update
    respond_to do |format|
      if @kit_instance.update(kit_instance_params)
        format.html { redirect_to kit_url(@kit_instance.kit), notice: "Kit instance was successfully updated." }
        format.json { render :show, status: :ok, location: @kit_instance }
      else
        format.html do
          @kit = @kit_instance.kit
          render 'kits/show', status: :unprocessable_entity
        end
        format.json { render json: @kit_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kit_instances/1 or /kit_instances/1.json
  def destroy
    @kit_instance.destroy

    respond_to do |format|
      format.html { redirect_to kit_url(@kit_instance.kit), notice: "Kit instance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit_instance
      @kit_instance = KitInstance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kit_instance_params
      params.require(:kit_instance).permit(:kit_id, :status, :notes)
    end
end

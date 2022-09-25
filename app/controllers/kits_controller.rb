class KitsController < ApplicationController
  before_action :set_kit, only: %i[ show edit update destroy ]

  # GET /kits or /kits.json
  def index
    @kits = Kit.all
    @kit_instances = KitInstance.all
  end

  # GET /kits/1 or /kits/1.json
  def show
    @kit_instance = @kit.kit_instances.build(kit: @kit)
  end

  # GET /kits/new
  def new
    @create_boxes = true
    @kit = Kit.new(materials: [Material.find_by(name: 'Plastic')]).tap {|kit| kit.kit_instances.build }
  end

  # GET /kits/1/edit
  def edit
    @create_boxes = false
  end

  # POST /kits or /kits.json
  def create
    @kit = Kit.new(kit_params)

    respond_to do |format|
      if @kit.save
        format.html { redirect_to kits_url, notice: "Kit was successfully created." }
        format.json { render :show, status: :created, location: @kit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kits/1 or /kits/1.json
  def update
    respond_to do |format|
      if @kit.update(kit_params)
        format.html { redirect_to kit_url(@kit), notice: "Kit was successfully updated." }
        format.json { render :show, status: :ok, location: @kit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kits/1 or /kits/1.json
  def destroy
    @kit.destroy

    respond_to do |format|
      format.html { redirect_to kits_url, notice: "Kit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_kit
    @kit = Kit.find(params[:id])
  end

  def kit_params
    submitted = params.require(:kit)
      .permit(
        :name,
        :status,
        :quantity,
        :kit_scale_id,
        :persist_box,
        material_ids: [],
        producer_ids: [],
        kit_line_ids: [],
        designer_ids: [],
        source_material_ids: [],
        kit_link_ids: [],
        kit_instances_attributes: [
          :status,
          :notes,
          :location_id,
        ],
      )

    # Supported by Kit#persist_box virtual attr
    persist_box = ActiveModel::Type::Boolean.new.cast(submitted.delete(:persist_box))

    return submitted if persist_box

    submitted.reject {|key, value| key == "kit_instances_attributes"}
  end
end

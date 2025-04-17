class ProductAttributesController < ApplicationController
  before_action :set_product_attribute, only: %i[ show edit update destroy ]

  # GET /product_attributes or /product_attributes.json
  def index
    @product_attributes = ProductAttribute.all
  end

  # GET /product_attributes/1 or /product_attributes/1.json
  def show
  end

  # GET /product_attributes/new
  def new
    @product_attribute = ProductAttribute.new
  end

  # GET /product_attributes/1/edit
  def edit
  end

  # POST /product_attributes or /product_attributes.json
  def create
    @product_attribute = ProductAttribute.new(product_attribute_params)

    respond_to do |format|
      if @product_attribute.save
        format.html { redirect_to @product_attribute, notice: "Product attribute was successfully created." }
        format.json { render :show, status: :created, location: @product_attribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_attributes/1 or /product_attributes/1.json
  def update
    respond_to do |format|
      if @product_attribute.update(product_attribute_params)
        format.html { redirect_to @product_attribute, notice: "Product attribute was successfully updated." }
        format.json { render :show, status: :ok, location: @product_attribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_attributes/1 or /product_attributes/1.json
  def destroy
    @product_attribute.destroy!

    respond_to do |format|
      format.html { redirect_to product_attributes_path, status: :see_other, notice: "Product attribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_attribute
      @product_attribute = ProductAttribute.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_attribute_params
      params.expect(product_attribute: [ :product_id, :attribute_name, :attribute_value ])
    end
end

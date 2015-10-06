class ShopTagsController < ApplicationController
  before_action :set_shop_tag, only: [:show, :edit, :update, :destroy]

  # GET /shop_tags
  # GET /shop_tags.json
  def index
    @shop_tags = ShopTag.all
  end

  # GET /shop_tags/1
  # GET /shop_tags/1.json
  def show
  end

  # GET /shop_tags/new
  def new
    @shop_tag = ShopTag.new
  end

  # GET /shop_tags/1/edit
  def edit
  end

  # POST /shop_tags
  # POST /shop_tags.json
  def create
    @shop_tag = ShopTag.new(shop_tag_params)

    respond_to do |format|
      if @shop_tag.save
        format.html { redirect_to @shop_tag, notice: 'Shop tag was successfully created.' }
        format.json { render :show, status: :created, location: @shop_tag }
      else
        format.html { render :new }
        format.json { render json: @shop_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_tags/1
  # PATCH/PUT /shop_tags/1.json
  def update
    respond_to do |format|
      if @shop_tag.update(shop_tag_params)
        format.html { redirect_to @shop_tag, notice: 'Shop tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_tag }
      else
        format.html { render :edit }
        format.json { render json: @shop_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_tags/1
  # DELETE /shop_tags/1.json
  def destroy
    @shop_tag.destroy
    respond_to do |format|
      format.html { redirect_to shop_tags_url, notice: 'Shop tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_tag
      @shop_tag = ShopTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_tag_params
      params.require(:shop_tag).permit(:shop_id, :tag)
    end
end

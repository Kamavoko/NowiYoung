class ShopsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @search = Shop.search(params[:q])
    @shops = @search.result
    # @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
    #   marker.lat shop.latitude
    #   marker.lng shop.longitude
    #   marker.infowindow shop.description
    #   marker.json({title: shop.title})
    #       end
    #     end
    #   end
  end

  def show
  #  @shop = Shop.all
  end
  def new
    @shop = Shop.new
  end

  #作成中
  def create
    @shop = Shop.new(shop_params)
    #保存条件を満たさなかったらページに残る
    #binding.pry
    if @shop.save
      redirect_to shops_path
    else
      render 'new'
    end
  end
  #編集
  def edit
  #  @shop = Project.find(params[:id])
  end
  #更新
  def update
  #    @project = Project.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shops_path
    else
      render 'edit'
    end
  end

  def destroy
    #    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end


  #指定したフォーマット以外を弾く
  private
  def shop_params
    # 受け渡すパワメータと一致するのを確認
    params[:shop].permit(:name,:category_id,:longitude,:latitude, :address,:homepage,:image  )
  #  params.require(:shop).permit(:name, :description, :image)
  end
  def set_project
  @shop = Shop.find(params[:id])
  end
end

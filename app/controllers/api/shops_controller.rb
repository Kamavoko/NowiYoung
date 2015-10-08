class Api::ShopsController < Api::ApplicationController


  before_action :set_project, only: [:show, :edit, :update, :destroy]
  #  before_action :authenticate_user!, :except => [:show, :index]

  def index
    #検索結果に合うものだけを表示
    @search = Shop.search(params[:q])
    @shops = @search.result
    # @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
    #    marker.lat shop.latitude
    #    marker.lng shop.longitude
    #    marker.infowindow shop.desc
    #    marker.json({title: shop.name, icon: '/images/a.png'})
    #end
    render json: @shops
  end
  def show
    #  @shop = Shop.all
    # @hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
    #   marker.lat shop.latitude
    #   marker.lng shop.longitude
    #   marker.picture({
    #                   :anchor => [32, 32],
    #                   :url    => "http://www.tyto-style.com/imgfiles/images/matters/icon/080713icons/blue32_q.png",
    #                   :width  => "32",
    #                   :height => "32"
    #
    #   })
    #   marker.infowindow shop.desc
    #   #  marker.infowindow render_to_string(:partial => "/users/my_template", :locals => { :object => user}).gsub(/\n/, '').gsub(/"/, '\"')
    #   #marker.title   "i'm the title"
    #   marker.json({title: shop.name})
    #  end
    render json: @shop
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
    #   redirect_to shops_path
    # else
    #   render 'new'
    # end
      render json: @shop, status: :created, location: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
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
    #   redirect_to shops_path
    # else
    #   render 'edit'
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    #    @shop = Shop.find(params[:id])
    @shop.destroy
    # redirect_to shops_path
      head :no_content
  end


  #指定したフォーマット以外を弾く
  private
  def shop_params
    # 受け渡すパワメータと一致するのを確認
    params[:shop].permit(:name, :category_id, :longitude, :latitude, :desc, :address, :homepage, :image, tag_ids:[] )
  #  params.require(:shop).permit(:name, :description, :image)
  end
  def set_project
  @shop = Shop.find(params[:id])
  end
end

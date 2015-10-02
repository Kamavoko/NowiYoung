class PhotosController < ApplicationController
  #作成中
  def create
    #ショップ情報の取得
    @shop = Shop.find(params[:shop_id])
    @photo = @shop.photos.create(photo_params)
    #保存条件を満たさなかったらページに残る
    # if @comment.save
       redirect_to shop_path(@shop.id)
    # else
    #   render 'new'
    # end
  end




  #指定したフォーマット以外を弾く
  private
  def photo_params
    # 受け渡すパワメータと一致するのを確認
    params[:photo].permit(:image, :desc)
  #  params.require(:shop).permit(:name, :description, :image)
  end
  def set_project
  @shop = Shop.find(params[:id])
  end
end

class Api::PhotosController < Api::ApplicationController
  #作成中
  def create
    #@shop = Shop.find(params[:id])
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to shop_path(@photo.shop.id)
    else
      redirect_to shop_path(@photo.shop.id)
    end

    def destroy
        @photo = Photo.find(params[:id])
        # 認証してないと消せない
        authorize! :destroy, @photo
        @photo.destroy
        redirect_to shop_path(params[:shop_id])
      end

    #ショップ情報の取得
    # @shop = Shop.find(params[:shop_id])
    # @photo = @shop.photos.create(photo_params)

    #保存条件を満たさなかったらページに残る
    # if @comment.save
      #  redirect_to shop_path(@shop.id)
    # else
    #   render 'new'
    # end
  end

  #指定したフォーマット以外を弾く
  private

  def photo_params
    # 受け渡すパワメータと一致するのを確認
    # ログインしてるユーザの情報だけに絞る
    params.require(:photo).permit(:shop_id, :image, :desc).merge(user_id: current_user.id)
  end

  def set_project
    @shop = Shop.find(params[:id])
  end
end

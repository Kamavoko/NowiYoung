class Api::CommentsController < Api::ApplicationController
  #作成中
  def create
    #ショップ情報の取得
    # @shop = Shop.find(params[:shop_id])
    # @comment = @shop.comments.create(comment_params)
    #保存条件を満たさなかったらページに残る
    # if @comment.save
      #  redirect_to shop_path(@shop.id)
    # else
    #   render 'new'
    # end
  #  @shop = Shop.find(params[:id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to shop_path(@comment.shop.id)
    else
      redirect_to shop_path(@comment.shop.id)
    end
  end

  def destroy
      @comment = Comment.find(params[:id])
      # 認証してないと消せない
      authorize! :destroy, @comment

      @comment.destroy
      redirect_to shop_path(params[:shop_id])
    end


  #指定したフォーマット以外を弾く
  private
  def comment_params
    # 受け渡すパワメータと一致するのを確認
    params.require(:comment).permit(:shop_id, :text ).merge(user_id: current_user.id)
    # params.require(:comment).permit(:name, :description, :image)
  end
  def set_project
  @shop = Shop.find(params[:id])
  end
end

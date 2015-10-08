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
      render json: @comment
    else
      render json: @comment.errors
    end
  end

  def destroy
      @comment = Comment.find(params[:id])
      # 認証してないと消せない
      authorize! :destroy, @comment

      @comment.destroy
      head :no_content
  end


  #指定したフォーマット以外を弾く
  private
  def comment_params
    # 受け渡すパワメータと一致するのを確認
    params.require(:comment).permit(:shop_id, :text ).merge(user_id: 1)
    # params.require(:comment).permit(:name, :description, :image)
  end
  def set_project
  @shop = Shop.find(params[:id])
  end
end

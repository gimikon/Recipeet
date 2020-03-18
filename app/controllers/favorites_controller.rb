class FavoritesController < ApplicationController
  before_action :authenticate_user

  def create
    # 変数@likeを定義してください
    @favorite = Favorite.new(user_id: @current_user.id, post_id: params[:post_id])

    # 変数@likeを保存してください
    @favorite.save

    # 投稿詳細ページにリダイレクトしてください
    redirect_to("/posts/#{params[:post_id]}")

  end

  def destroy
   @favorite = Favorite.find_by(user_id: @current_user.id, post_id: params[:post_id])
   @favorite.destroy
   redirect_to("/posts/#{params[:post_id]}")
 end
end

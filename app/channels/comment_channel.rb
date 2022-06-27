class CommentChannel < ApplicationCable::Channel
  def subscribed
    @item = Item.find(params[:item_id]) # 追記
    stream_for @item
    
    # stream_from "comment_channel"
    # stream_fromメソッドとは、サーバーとクライアントを関連付けるメソッド
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # comment_channel.rbの役割
  # チャネルを設定するファイルであり、クライアントとサーバーを結びつける
end

class MessagesController < WebsocketRails::BaseController
  def new
    broadcast_message :spread_message, message #ブラウザから送られてきたデータはmessageに入っている
  end
end

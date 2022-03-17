class AuthsController < ApplicationController
  def create
    hmac_secret = 'MySe3cretK2y'
    payload = { name: params[:name], exp: Time.now.to_i + 30}
    token = JWT.encode payload, hmac_secret, 'HS256'
    render json:{token: token}
  end
end

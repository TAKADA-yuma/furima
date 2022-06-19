class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show]
 def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?
    # authenticate_user!的なやつ

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  def new
  end

end
class CardsController < ApplicationController
  def index
    cards = Card.where(event_id: card_params[:event_id]).includes(:user).map(&:info)
    render json: { cards: cards }
  end

  def show
    current_user = User.find_by(uid: params[:id])
    if current_user.blank?
      render status: 404, json: { messages: ["No User Registration"] }
    else
      render json: Card.find_by(event_id: params[:event_id], user_id: current_user.id).info
    end
  end

  def create
    current_user = User.where(uid: card_params[:uid]).first_or_create

    card = Card.where(user_id: current_user.id, event_id: card_params[:event_id]).first_or_initialize
    card.name      = card_params[:name]
    card.age       = card_params[:age]
    card.tag_1     = card_params[:keyword_1]
    card.tag_2     = card_params[:keyword_2]
    card.tag_3     = card_params[:keyword_3]
    card.profile_1 = card_params[:profile_1]
    card.profile_2 = card_params[:profile_2]
    card.profile_3 = card_params[:profile_3]
    card.save
    render status: 201, json: { message: "created." }
  end

  private
  def card_params
    params.permit(:event_id, :uid, :name, :age, :keyword_1, :keyword_2, :keyword_3, :profile_1, :profile_2, :profile_3)
  end
end

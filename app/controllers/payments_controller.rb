class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    
    def success

    end

    def webhook
        puts params
        # payment_id= params[:data][:object][:payment_intent]
        # payment = Stripe::PaymentIntent.retrieve(payment_id)
        # textbook_id = payment.metadata.textbook_id
        # user_id = payment.metadata.user_id

        # p "textbook id " + textbook_id
        # p "user id " + user_id

        # status 200
    end
end
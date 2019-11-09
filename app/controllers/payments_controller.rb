class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    
    def success

    end

    def webhook
        # puts params

        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        
        # textbook_id = payment.metadata.textbook_id
        # user_id = payment.metadata.user_id

        Payment.create(
            user_id: payment.metadata.user_id,
            textbook_id: payment.metadata.textbook_id,
            stripe_id: payment.id
        )

        # pp record.errors
        # record.save

        p "textbook id " + textbook_id
        p "user id " + user_id
    end
end
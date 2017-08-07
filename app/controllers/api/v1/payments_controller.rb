class Api::V1::PaymentsController < ApplicationController
	before_action :authenticate_api_v1_user!

	def paypal
		paypal_params = params.require(:payment).permit(:payer_email,:recipient_name, :payer_id, :state,
									:currency, :paypal_id, :amount, :sale_id)
		payment = PayPalPayment.new(paypal_params)
		authorize payment
		if payment.save
			render json: payment, status: :created
		else
			render json: { errors: payment.errors }, status: :unprocessable_entity
		end
	end
end

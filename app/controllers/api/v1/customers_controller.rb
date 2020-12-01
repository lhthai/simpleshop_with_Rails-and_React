module Api
    module V1
        class CustomersController < ApplicationController
            protect_from_forgery with: :null_session
            def index
                customers = Customer.all

                render json: CustomerSerializer.new(customers).serialized_json
            end

            def show
                customer = Customer.find_by(id: params[:id])
                render json: CustomerSerializer.new(customer).serialized_json
            end

            def create
                customer = Customer.new(customer_params)

                if customer.save
                    render json: CustomerSerializer.new(customer).serialized_json
                else
                    render json: {errors: customer.errors.messages}, status: 400
                end
            end
            
            def update
                customer = Customer.find_by(id: params[:id])

                if customer.update(customer_params)
                    render json: CustomerSerializer.new(customer).serialized_json
                else
                    render json: {errors: customer.errors.messages}, status: 400
                end
            end

            def destroy
                customer = Customer.find_by(id: params[:id])

                if customer.destroy
                    head :no_content
                else
                    render json: {errors: customer.errors.messages}, status: 400
                end
            end
            
            private
            def customer_params
                params.require(:customer).permit(:fullname, :phone, :email, :password, :billing_address, :shipping_address, :country)
            end
            
        end
    end
end
module Api
    module V1
        class ProductsController < ApplicationController
            protect_from_forgery with: :null_session
            def index
                products =Product.all
                
                render json: ProductSerializer.new(products).serialized_json
            end

            def show
                product = Product.find_by(id: params[:id])

                render json: ProductSerializer.new(product).serialized_json   
            end

            def create
                product = Product.new(product_params)

                if product.save
                    render json: ProductSerializer.new(product).serialized_json                        
                else
                    render json: {error: product.errors.messages}, status: 400
                end
            end

            def update
                product = Product.find_by(id: params[:id])

                if product.update(product_params)
                    render json: ProductSerializer.new(product).serialized_json                                  
                else
                    render json: {error: product.errors.messages}, status: 400
                end
            end

            def destroy
                product = Product.find_by(id: params[:id])

                if product.destroy
                    head :no_content                                  
                else
                    render json: {error: product.errors.messages}, status: 400
                end
            end
                       
            private

            def product_params
                params.require(:product).permit(:sku, :name, :price, :description, :thumbnail, :category_id)
            end
                       
        end
        
    end
    
end
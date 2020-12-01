module Api
    module V1
         class CategoriesController < ApplicationController
            protect_from_forgery with: :null_session
             def index
                 categories = Category.all

                 render json: CategorySerializer.new(categories).serialized_json
             end

             def show
                 category = Category.find_by(id: params[:id])

                 render json: CategorySerializer.new(category).serialized_json
             end

             def create
                 category = Category.new(category_params)

                 if category.save
                    render json: CategorySerializer.new(category).serialized_json                  
                 else
                    render json: {error: category.errors.messages}, status: 400
                 end                
             end
             
             def update
                category = Category.find_by(id: params[:id])

                if category.update(category_params)
                   render json: CategorySerializer.new(category).serialized_json                  
                else
                   render json: {error: category.errors.messages}, status: 400
                end                
            end

            def destroy
                category = Category.find_by(id: params[:id])

                if category.destroy
                  head :no_content                
                else
                   render json: {error: category.errors.messages}, status: 400
                end                
            end
             

             private
             def category_params
                 params.require(:category).permit(:name, :description)
             end
             
         end
    end
    
end
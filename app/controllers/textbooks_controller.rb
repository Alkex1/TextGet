class TextbooksController < ApplicationController
    before_action :authenticate_user!

        
    def index
        @subject = Subject.all
        if params[:search]
            @textbook = Textbook.where("name LIKE ?", "%#{params[:search]}%")
        else
            @textbook = Textbook.all
        end    
        # if params[:search] && !params[:search].empty?
        #     @textbook = Textbook.where(name: params[:search])
        # else
        #     @textbook = Textbook.all
        # end
    end

    def show
        @textbook = Textbook.find(params[:id])
        @txtname = @textbook.name
        # retrieves all of the subject names for given textbook in an array.
        # @subjects = Subject.all
        @subjects = @textbook.subjects.pluck(:name)
    end

    def create
        # allows the user to add the name, author, release date, description, price, r-price and a picture if they choose.
        whitelisted_params = params.require(:textbook).permit(:name, :author, :release_date, :description, :price, :retail_price, :pic)
        @textbook = current_user.textbooks.create(textbook_params)
        # if there are any errors, goes back to the new page in view
        if @textbook.errors.any?
            render "new"
        else
            redirect_to textbooks_path(@textbook)
        end
    end

    def new
        @textbook = Textbook.new
    end

    def update
        if @textbook.errors.any?
            @subject = Subject.all
            render "new"
        else
            redirect_to textbooks_path(@textbook)
        end

        # @textbook = textbook.find(params[:id])
        # @textbook.update(textbook: params[name of table][:name of thing to be changed])
        # redirect to textbook_path
    end

    def edit
        # @textbook = Texbook.find(params[:id])
    end

    def destroy

        id = params[:id]
        @textbook = Textbook.find(params[:id].destroy)
        redirect_to textbook_path
    end
end

private

def textbook_params
    params.require(:textbook).permit(:name, :author, :release_date, :description, :price, :retail_price, :pic)
end

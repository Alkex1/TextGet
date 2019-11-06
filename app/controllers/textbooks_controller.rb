class TextbooksController < ApplicationController
    before_action :set_user_textbook, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

        
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
        whitelisted_params = params.require(:textbook).permit(:name, :subject, :author, :release_date, :description, :price, :retail_price, :picture)
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
        @subject = Subject.all
    end

    def edit
        @textbook = Textbook.find(params[:id])
    end

    def update
        @textbook = Textbook.find(params[:id])

        if @textbook.update(textbook_params)
            redirect_to textbook_path(params[:id])
        else
            @textbooks = Textbook.all
            # @textbook.all
            render "edit"
        end

        # @textbook = textbook.find(params[:id])
        # @textbook.update(textbook: params[name of table][:name of thing to be changed])
        # redirect to textbook_path
    end

    

    def destroy

        # id = params[:id]
        @textbook = Textbook.find(params[:id]).destroy
        redirect_to textbooks_path
    end
end

private

def textbook_params
    params.require(:textbook).permit(:name, :subject, :author, :release_date, :description, :price, :retail_price, :picture)
end

def set_textbook

end

def set_user_textbook
    @textbook = current_user.textbooks.find_by_id(params[:id])

    if @textbook == nil
        redirect_to textbooks_path
    end
end

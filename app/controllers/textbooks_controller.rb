class TextbooksController < ApplicationController
    before_action :authenticate_user!
        
    def index
        @subject = Subject.all

        if params[:search] && !params[:search].empty?
            @textbook = Textbook.where(name: params[:search])
        else
            @textbook = Textbook.all
        end
    end

    def show
        @textbook = Textbook.find(params[:id])
        @txtname = Textbook.find(params[:id]).name
        # retrieves all of the subject names for given textbook in an array.
        @subject = Textbook.find(params[:id]).subjects.pluck(:name)
    end

    def create

    end

    def new
        @textbook = Textbook.new
    end

    def update

    end

    def edit

    end
end
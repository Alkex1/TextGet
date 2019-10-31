class TextbooksController < ApplicationController
    before_action :authenticate_user!
        
    def index
       @textbook = Textbook.all
       @subject = Subject.all 
    end

    def show

    end

    def create

    end

    def new
        
    end

    def update

    end

    def edit

    end
end
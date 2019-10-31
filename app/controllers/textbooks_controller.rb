class TextbooksController < ApplicationController
    before_action :authenticate_user!
        
    def index
       @textbook = Textbook.all
       @subject = Subject.all
    #    @subtext = Subject.textbooks.all
    #    @subjectname = Subject.find(1)


    end

    def show
        @textbook = Textbook.find(params[:id])
        # @subject = Subject.find(params[:id])
    end

    def showsubject
        @subject = Subject.all
        @showsubject = Subject.find(1)
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
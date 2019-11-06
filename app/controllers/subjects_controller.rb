class SubjectsController < ApplicationController
    def show
        @subject = Subject.find(params[:id])

        @textbooks = Subject.find(params[:id]).textbooks
    end

    def new
        @subject = Subject.all
    end
end
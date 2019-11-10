class SubjectsController < ApplicationController
    before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

    def show
        @subject = Subject.find(params[:id])

        @textbooks = Subject.find(params[:id]).textbooks
    end

    def new
        @subject = Subject.all
    end
end
class ProfilesController < ApplicationController

    def show
        @user = User.all
        @current_user = User.find(current_user[:id])
        @textbooks = User.find(current_user[:id]).textbooks
    end
end
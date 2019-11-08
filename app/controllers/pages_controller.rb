class PagesController < ApplicationController
    def home
        @subject = Subject.all

        if params[:search]
            @textbook = Textbook.where("name LIKE ?", "%#{params[:search]}%")
        else
            @textbook = Textbook.all
        end
        if @textbook.count > 0
        @rtextbook = []
        while @rtextbook.length < 3 do 
            
            @rtextbook.push(@textbook.sample)
            @rtextbook = @rtextbook.uniq
        end
    end
    end
end
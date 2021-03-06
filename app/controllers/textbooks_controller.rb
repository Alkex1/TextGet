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
    end

    def show
        @textbook = Textbook.find(params[:id])
        @txtname = @textbook.name
        # retrieves all of the subject names for given textbook in an array.       
        @subjects = @textbook.subjects.pluck(:name)
        
        
        session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @textbook.name,
            amount: @textbook.price,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                textbook_id: @textbook.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&textbookId=#{@textbook.id}",
        cancel_url: "#{root_url}textbooks"
    )
    

        @session_id = session.id
        end
    

    def create
        # allows the user to add the name, author, release date, description, price, r-price and a picture if they choose.
        whitelisted_params = textbook_params
        @textbook = current_user.textbooks.create(textbook_params)
        # @textbooks_subject = current_user.textbooks_subject.create(tbooksub)
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
    end

    

    def destroy

        # id = params[:id]
        @textbook = Textbook.find(params[:id]).destroy
        redirect_to textbooks_path
    end
end

private

def textbook_params
    params.require(:textbook).permit(:name, :condition, :subject, :author, :release_date, :description, :price, :retail_price, :picture)
end

# couldn't pass subject through to the model, tried to run another method to take the subject id from the new textbook form.
# def tbooksub
#     params.require(:textbooks_subject).permit(:subject_id)
# end


def set_user_textbook
    @textbook = current_user.textbooks.find_by_id(params[:id])

    if @textbook == nil
        redirect_to textbooks_path
    end
end

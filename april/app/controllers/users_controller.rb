class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
	end

    def create
        @user = User.new(params[:user])
        if @user.save
            redirect_to "/users/show", notice: "Notice! Created New User!"
        else
            render "new"
        end
    end

    def show
	end
end
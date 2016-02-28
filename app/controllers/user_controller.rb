class UserController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.by_uuid(params[:id]).first
	end

	def login
		@user = User.by_username(params[:id]).first
	end

end

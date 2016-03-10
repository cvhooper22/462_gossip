class UserController < ApplicationController
    def index
		@users = User.all
	end

	def show
        @user = User.by_username(params[:id]).first
	end

    def notify
        byebug
        @user = User.by_uuid(params[:uuid]).first
        redirect_to(action: 'show', id: @user.username, message: params[:message] )
    end

    def test
    end

    def tnotify
        byebug
        render nothing: true
    end

	def login
		@user = User.by_username(params['username']).first
        if @user.nil?
            uuid = SecureRandom.uuid
            @user = User.create(:username => params['username'], :uuid => uuid, :active => true)
        else
            @user.update(active: true)
        end
        redirect_to :action => 'show', :id => @user.username 
	end

end

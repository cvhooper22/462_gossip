class UserController < ApplicationController
    def index
		@users = User.all
	end

	def show
    # response.headers['Content-Type'] = 'text/event-stream'
    # # sse = SSE.new(response.stream)
    # begin
  		# @user = User.by_uuid(params[:id]).first
    #   sse.write(@user.to_json)
    # rescue IOError
    #   puts 'Client Disconnected'
    # ensure
    #   sse.close
    # end
    # render nothing: true
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
            @user = User.create(:username => params['username'], :uuid => uuid)
        end
        redirect_to :action => 'show', :id => @user.username 
	end

end

class UserController < ApplicationController
	include ActionController::Live
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

	def login
		@user = User.by_username(params[:id]).first
	end

end

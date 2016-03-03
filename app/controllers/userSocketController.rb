class UserSocketController < WebsocketRails::BaseController
  def client_connected
    puts 'client has connected'
  end

  def delete_user
    puts 'delete a user!'
  end
end
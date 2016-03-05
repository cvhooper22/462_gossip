class UserSocketController < WebsocketRails::BaseController
  def client_connected
    puts 'client has connected'
  end

  def register
    byebug
    user_guid = message.guid
    WebsocketRails.users[user_guid] = connection
  end

  def delete_user
    puts 'delete a user!'
  end
end
class GossipnodeController < WebsocketRails::BaseController
  def client_connected
    puts 'client has connected'
  end

  def register
    puts 'register event!'
    user_guid = message
    WebsocketRails.users[user_guid] = connection
  end

  def delete_user
    puts 'delete a user!'
    @my_guid = 'not there'
    registered_users = WebsocketRails.users.users
    registered_users.each do |guid, user_connection|
      user_connections = user_connection.connections
      found = user_connections.find {|conn| conn.id == connection.id }
      if found
        @my_guid = guid 
      end
    end
    WebsocketRails.users.users.delete(@my_guid)
    puts "removed connections from #{@my_guid}"
  end
end
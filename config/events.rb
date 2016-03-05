WebsocketRails::EventMap.describe do
  # You can use this file to map incoming events to controller actions.
  # One event can be mapped to any number of controller actions. The
  # actions will be executed in the order they were subscribed.
  #
  # Uncomment and edit the next line to handle the client connected event:
  #   subscribe :client_connected, :to => Controller, :with_method => :method_name
  #
  # Here is an example of mapping namespaced events:
  #   namespace :product do
  #     subscribe :new, :to => ProductController, :with_method => :new_product
  #   end
  # The above will handle an event triggered on the client like `product.new`.
  
  subscribe :register, :to => GossipnodeController, :with_method => :register
  # The :client_connected method is fired automatically when a new client connects
  subscribe :client_connected, :to => GossipnodeController, :with_method => :client_connected
  # The :client_disconnected method is fired automatically when a client disconnects
  subscribe :client_disconnected, :to => GossipnodeController, :with_method => :delete_user
  # The :connection_closed method is fired automatically when a client loses connection without sending a disconnect frame.
  subscribe :connection_closed, :to => GossipnodeController, :with_method => :delete_user

end

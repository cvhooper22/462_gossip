class User < ActiveRecord::Base
	scope :by_uuid, -> (uuid) { where ({uuid: uuid}) }
	scope :by_username, -> (username) { where ({username: username}) }
end

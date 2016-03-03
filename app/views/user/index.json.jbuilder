json.array! @users do |user|
  json.call(user,
            :username,
            :uuid)
end
class User < ActiveRecord::Base
  # validate the presence of user: email, user, instagram_id
  # after user account created, check if email is nil then redirect and prompt for email
end
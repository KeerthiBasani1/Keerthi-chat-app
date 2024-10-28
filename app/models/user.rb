class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def online?
    Redis.current.get("user_#{id}_online") == '1'
  end


  def set_online
    Redis.current.set("user_#{id}_online", '1')
  end

  def set_offline
    Redis.current.del("user_#{id}_online")
  end

end

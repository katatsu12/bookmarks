class User < ApplicationRecord
  has_many :bookmarks
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
    )
  end

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def self.get_friends_bookmarks(current_user)
    friend = Friendship.where(user_id: current_user)
    hash = {}

    friend.each do |i|
      friends_bookmark = Bookmark.where(user_id: i.friend_id)
      mas = []
      friends_bookmark.each do |b|
        users_mas = []
        users_mas << b.title
        users_mas << b.url
        users_mas << b.image
        mas << users_mas
      end
      user_name = User.find(i.friend_id).name
      hash.merge!(user_name => mas)
    end
    print hash
    hash
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :bands, :through => :users_band
has_many :users_band
#validates :email, uniqueness: true
before_save { self.email = email.downcase }

validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }




	def calculate_distance(a,b)
		a.distance_to(b)
	end

  def self.user_favorite_bands(array)
    array.map do |id|
         Band.find(id)
      end

  end

  def self.favorite_bands(array)
      @user_favorite_bands = array.map do |id|
         Band.find_by(id: id)
      end
      @user_favorite_bands   
  end

  def add_band(band)
    self.bands.push(band)
  end
end

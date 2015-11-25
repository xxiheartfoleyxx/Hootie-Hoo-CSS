class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations, :foreign_key => :sender_id
  validates :name, presence: true

  has_one :profile
  accepts_nested_attributes_for :profile
  after_create :profile


  # before_create :build_profile #creates profile at user registration
  after_create :create_default_conversation

  def profile
    self.build_profile(user_id: self.id)
  end

  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end
end

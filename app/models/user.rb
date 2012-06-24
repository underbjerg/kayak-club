class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :phone_number, :admin, :state

  validates_presence_of :first_name, :last_name, :phone_number

  has_many :event_registrations, :dependent => :destroy
  has_many :event_occurrences, :through => :event_registrations

  def full_name
    first_name + " " + last_name
  end

  state_machine :state, :initial => :new do
    event :approve do
      transition [:new, :rejected] => :approved
    end
    event :reject do
      transition [:new, :approved] => :rejected
    end
  end

  def active_for_authentication?
    # Comment out the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && approved?
  end

  #def initialize
  #  super() # NOTE: This *must* be called, otherwise states won't get initialized
  #end

end

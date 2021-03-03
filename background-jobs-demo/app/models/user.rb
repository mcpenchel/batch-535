class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  after_commit :enrich_data # commit triggers for update AND create

  def enrich_data # instance method
    UserJob.perform_later(id) # .wait_until(tomorrow)
  end
end

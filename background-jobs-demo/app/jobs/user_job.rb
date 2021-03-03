class UserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)

    puts "Going to Clearbit API to enrich #{user.email}.."
    sleep(10)
    puts "Finished enriching the user."
  end
end

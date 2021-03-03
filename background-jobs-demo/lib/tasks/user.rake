namespace :user do
  desc "Updates all the users in the DB with additional info from Clearbit API (assync)"
  task update_all: :environment do
    puts "Starting to update my users!"

    User.all.each do |user|
      UserJob.perform_later(user.id)
      puts "Enriching #{user.email} right now..."
    end

    puts "Done!"
  end

  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UserJob.perform_now(user.id)
    # rake task will return when job is _done_
  end
end

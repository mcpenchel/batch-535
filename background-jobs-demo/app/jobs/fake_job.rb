class FakeJob < ApplicationJob
  queue_as :default

  # perform_later
  # perform_now -> Executes the code in a **Synchronous** way
  def perform
    puts "Pretending I'm doing something which takes time..."
    # Do something later
    sleep(10)
    puts "Finished my important task!"
  end
end

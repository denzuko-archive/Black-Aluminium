task :cron => :environment do
  if time.now.hour == 0
    puts "Updating application..."
    # do work
    puts "done."
  end
end
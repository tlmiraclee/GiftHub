# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# run 'whenever --update-crontab GiftHub' to add cron jobs
# run 'crontab -l' to list the cron jobs added

# == development ==
# set :output, "~/Documents/GiftHub/log/cron_log.log"

# every :reboot do
#   command "RAILS_ENV=development bin/delayed_job start"
# end

# every 1.hour do
#   command "RAILS_ENV=development bin/delayed_job start"
# end

# == production ==
set :output, "~/app/log/cron_log.log"

every :reboot do
  command "cd ~/app && RAILS_ENV=production bin/delayed_job start"
end

every 1.hour do
  command "cd ~/app && RAILS_ENV=production bin/delayed_job restart"
end

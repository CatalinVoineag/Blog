#!/usr/bin/env ruby require "rubygems" 
require "rubygems"
require "bundler/setup"
require "mailman"

#Mailman.config.logger = Logger.new("log/mailman.log")  # uncomment this if you can want to create a log file
Mailman.config.poll_interval = 3  # change this number as per your needs. Default is 60 seconds
Mailman.config.pop3 = {
  server: 'pop.gmail.com', port: 995, ssl: true,
  username: "catalin94v@gmail.com",
  password: "noexcuses414"
}
  Mailman::Application.run do
  default do
    begin
    
    Contact.send_message()
    rescue Exception => e
      Mailman.logger.error "Exception occurred while receiving message:n#{message}"
      Mailman.logger.error [e, *e.backtrace].join("n")
    end
  end
end 
# This is the script that kicks off a single CloudCrowd::Daemon. Because the 
# daemons don't load the entire rails stack, this file functions like a mini
# environment.rb, loading all the common gems that we need.

# CloudCrowd::App.root = File.expand_path(File.dirname(__FILE__) + '/../..') unless defined?(CloudCrowd::App.root)

# Standard Lib and Gems
require 'fileutils'
require 'rubygems'
require 'daemons'
require 'socket'
require 'yaml'
require 'json'
require 'rest_client'
require 'right_aws'

FileUtils.mkdir('log') unless File.exists?('log')

# Daemon/Worker Dependencies.
require "#{File.dirname(__FILE__)}/../cloud-crowd"

Daemons.run("#{CloudCrowd::App.root}/lib/cloud_crowd/daemon.rb", {
  :app_name   => "cloud_crowd_worker",
  :dir_mode   => :normal,
  :dir        => 'log',
  :multiple   => true,
  :backtrace  => true,
  :log_output => true
})
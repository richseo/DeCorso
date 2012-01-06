require File.expand_path('../config/application', __FILE__)
require 'rake'

Site::Application.load_tasks

namespace :deploy do
  USER    = 'root'.freeze
  HOST    = '173.255.221.78'.freeze
  PATH    = '/var/webapps/Makakilo-Elementary'.freeze
  GIT_URL = 'git@github.com:delonnewman/Makakilo-Elementary.git'.freeze
  DB_CONF = 'config/database.yml'.freeze
  SSH_KEY = "#{ENV['HOME']}/.ssh/id_rsa.pub".freeze

  desc "launch SSH on #{HOST}"
  task :shell do
    sh "ssh -t #{USER}@#{HOST}"
  end

  desc "setup for deployment on #{HOST}"
  task :setup do
    cmds = %{
      git clone #{GIT_URL} #{PATH} --depth 1
      cd #{PATH} &&
      bundle install --deployment
    }

    sh "ssh -t #{USER}@#{HOST} '#{cmds}'"
    sh "scp #{USER}@#{HOST}:#{PATH}/config/database.yml #{DB_CONF}" 
    sh "ssh -t #{USER}@#{HOST} 'cd #{PATH} && rake db:setup RAILS_ENV=production'"
  end

  desc "remove deployment on #{HOST}"
  task :remove do
    sh "ssh -t #{USER}@#{HOST} 'rm -rf #{PATH}'"
  end

  desc "export SSH key to #{HOST}"
  task :export_key do
    file = SSH_KEY.split('/').last

    cmds = %{
      cd ~ &&
      perl -e 'mkdir "$ENV{HOME}/.ssh" unless -e "$ENV{HOME}/.ssh"' &&
      cat #{file} >> $HOME/.ssh/authorized_keys
    }

    sh "scp #{SSH_KEY} #{USER}@#{HOST}:~"
    sh "ssh -t #{USER}@#{HOST} '#{cmds}'"
  end

  desc "deploy to #{HOST}"
  task :live do
    cmds = %{
      cd #{PATH} &&
      git pull &&
      bundle install --deployment &&
      rake db:migrate RAILS_ENV=production
      touch #{PATH}/tmp/restart.txt
    }

    sh "git push && ssh -t #{USER}@#{HOST} '#{cmds}'"
  end
end

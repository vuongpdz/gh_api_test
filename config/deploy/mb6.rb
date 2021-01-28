# frozen_string_literal: true

set :user, "zigexn"
set :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :staging_server, "mb6"
set :rbenv_path, "/home/#{fetch(:user)}/.rbenv"

server fetch(:staging_server), user: fetch(:user), roles: %w{app}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa_zigexn),
  forward_agent: true,
  auth_methods: %w(publickey)
}

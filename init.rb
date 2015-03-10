#!/bin/env ruby
# encoding: utf-8

require 'redmine'

Redmine::Plugin.register :chiliproject_quiet_parenttickets do
  name 'Quiet Parenttickets'
  author 'Alexander Blum'
  description 'This plugin for ChiliProject prevents notification on updates on parent tickets, if not explicitly watched.'
  version '0.1'
  author_url 'mailto:alexander.blum@c3s.cc'
  url 'https://github.com/C3S/chiliproject_quiet_parenttickets'
end

# Patch User
Dispatcher.to_prepare do
  require_dependency 'principal'
  require_dependency 'user'
  User.send(:include, UserPatch)
end
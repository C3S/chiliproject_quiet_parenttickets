#!/bin/env ruby
# encoding: utf-8

module UserPatch

  def self.included(base) # :nodoc:

    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :notify_about?, :no_parents
    end

  end

  module InstanceMethods

    def notify_about_with_no_parents?(object)
      if object.is_a?(Issue) and object.children? and not ((object.respond_to?(:watched_by?) && object.watched_by?(self)))
        false
      else
        notify_about_without_no_parents?(object)
      end
    end

  end

end
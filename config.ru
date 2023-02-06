require 'bundler'
Bundler.require
$:.unshift File.expand_path('lib', __dir__)
require 'controller'
require 'gossip'

run ApplicationController

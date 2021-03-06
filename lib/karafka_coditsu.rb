# frozen_string_literal: true

require 'karafka'
require 'airbrake'

Dir.glob(File.join(File.dirname(__FILE__), '**', '*.rb')).sort.each(&method(:require))

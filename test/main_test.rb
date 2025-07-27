# frozen_string_literal: true

require_relative '../lib/main'
require 'faker'
require 'byebug'

class MainTest
  def initialize
    @failures = []
  end

  def run_tests
    public_methods.select { |testcase| testcase =~ /\Atest_/ }.sort.each do |testcase|
      print "#{testcase}: "
      public_send testcase
      print "\n"
    end

    puts "\n\n"
    puts @failures
  end

  def test_hello_world
    out = Main.do
    assert('Hello, World!', out)
    assert(String, out.class)
    assert(nil, Main::Model.new.property)
  end

  def assert(lhs, rhs)
    if lhs == rhs
      print "\e[0;32m.\e[0m"
    else
      print "\e[0;31mF\e[0m"
      @failures << "#{lhs} != #{rhs}"
    end
  end
end

# MainTest.new.run_tests

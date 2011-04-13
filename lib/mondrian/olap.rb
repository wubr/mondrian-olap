require 'java'

directory = File.expand_path("../jars", __FILE__)
Dir["#{directory}/*.jar"].each do |file|
  require file
end

unless java.lang.System.getProperty("log4j.configuration")
  java.lang.System.setProperty("log4j.configuration", "file://#{directory}/log4j.properties")
end
# register Mondrian olap4j driver
Java::mondrian.olap4j.MondrianOlap4jDriver

%w(connection query result schema cube).each do |file|
  require "mondrian/olap/#{file}"
end

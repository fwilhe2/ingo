require 'bundler/gem_tasks'

task :test do
  ruby "test/unittest.rb"
  sh "docker build . -t ingo-system-test"
end

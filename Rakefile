require 'bundler/gem_tasks'

task :test do
  ruby 'test/unittest.rb'
end

task :build_docker_image do
  sh 'docker build -t registry.gitlab.com/fwilhe/ingo/image docker/production'
end

task :push_docker_image => :build_docker_image do
  sh 'docker push registry.gitlab.com/fwilhe/ingo/image'
end

require 'bundler/gem_tasks'

task :test do
  ruby 'test/unittest.rb'
end

task :build_docker_image do
  sh 'docker build -t docker.pkg.github.com/fwilhe2/ingo/ingo:latest docker/production'
end

task :push_docker_image => :build_docker_image do
  sh 'docker push docker.pkg.github.com/fwilhe2/ingo/ingo:latest'
end

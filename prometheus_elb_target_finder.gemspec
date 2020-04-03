# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prometheus_elb_target_finder/version'

Gem::Specification.new do |spec|
  spec.name          = 'prometheus_elb_target_finder'
  spec.version       = PrometheusElbTargetFinder::VERSION
  spec.authors       = ['Stjepan Hadjic']
  spec.email         = ['d4be4st@gmail.com']

  spec.summary       = 'Prometheus ELB Target finder'
  spec.description   = 'Prometheus ELB Target finder'
  spec.homepage      = 'https://github.com/infinum/prometheus-elb-target-finder'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/infinum/prometheus-elb-target-finder'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry-byebug'

  spec.add_dependency 'aws-sdk-elasticloadbalancingv2'
  spec.add_dependency 'dotenv'
  spec.add_dependency 'clockwork'
end

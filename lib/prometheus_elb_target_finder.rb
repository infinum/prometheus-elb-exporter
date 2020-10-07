require 'dotenv/load'
require 'aws-sdk-elasticloadbalancingv2'
require 'aws-sdk-ec2'
require 'prometheus_elb_target_finder/version'
require 'prometheus_elb_target_finder/finder'
require 'prometheus_elb_target_finder/output'

module PrometheusElbTargetFinder
  class Error < StandardError; end
end

require 'clockwork'
require 'prometheus_elb_target_finder'

module Clockwork
  handler do |_job|
    target_ids = PrometheusElbTargetFinder::Finder.new.target_ids
    puts target_ids
    PrometheusElbTargetFinder::Output.new(target_ids).create_file
  end

  every(1.minute, 'target_finder.job')
end

module PrometheusElbTargetFinder
  class Finder
    def target_ids
      response.target_health_descriptions.map do |thd|
        thd.target.id
      end
    end

    def response
      @response ||= 
        aws_client.describe_target_health(target_group_arn: ENV['AWS_TARGET_GROUP_ARN'])
    end

    def aws_client
      @aws_client ||= Aws::ElasticLoadBalancingV2::Client.new
    end
  end
end

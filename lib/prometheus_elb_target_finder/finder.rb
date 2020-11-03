module PrometheusElbTargetFinder
  class Finder
    def target_ids
      ids = response.target_health_descriptions.map do |thd|
        thd.target.id
      end
      response = ec2_client.describe_instances(instance_ids: ids)
      response.reservations.flat_map(&:instances).map(&:private_ip_address)
    end

    def response
      @response ||= 
        aws_client.describe_target_health(target_group_arn: ENV['AWS_TARGET_GROUP_ARN'])
    end

    def aws_client
      @aws_client ||= Aws::ElasticLoadBalancingV2::Client.new
    end

    def ec2_client
      @ec2_client ||= Aws::EC2::Client.new
    end
  end
end

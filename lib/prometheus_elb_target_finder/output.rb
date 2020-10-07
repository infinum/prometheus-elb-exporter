module PrometheusElbTargetFinder
  class Output
    def initialize(target_ids)
      @target_ids = target_ids
    end

    def create_file
      File.open(file_path, "w") { |f| f.write(target_hash.to_json) }
    end

    def target_hash # rubocop:disable Metrics/MethodLength
      [
        {
          targets: targets(9393),
          labels: {
            exporter: 'puma',
            app: 'loop',
            environment: 'uat',
            target: 'ecs'
          }
        },
        {
          targets: targets(9394),
          labels: {
            exporter: 'rails',
            app: 'loop',
            environment: 'uat',
            target: 'ecs'
          }
        },
        {
          targets: targets(9100),
          labels: {
            exporter: 'node',
            app: 'loop',
            environment: 'uat',
            target: 'ecs'
          }
        }
      ]
    end

    def targets(port)
      @target_ids.map do |id|
        "#{id}:#{port}"
      end
    end

    def file_path
      ENV['PROMETHEUS_TARGET_SD_PATH']
    end
  end
end

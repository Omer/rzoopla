module RZoopla
  class BaseCollection
    ATTRIBUTES = [:result_count, :page_number, :page_size, :results]
    DEFAULT_PAGINATION_OPTIONS = {
      page_number: 1,
      page_size: 10
    }

    attr_reader(*ATTRIBUTES)

    include Enumerable

    def initialize(options = {})
      ATTRIBUTES.each do |attr|
        instance_variable_set("@#{attr}", options[attr])
      end
    end

    def each(&block)
      @results.each(&block)
    end

    def size
      @results.size
    end

    def [](index)
      @results[index]
    end

    def self.where(options = {})
      opt = DEFAULT_PAGINATION_OPTIONS.clone.merge(options)
      result = RZoopla::Utils.symbolize_keys(RZoopla::Client.get(end_point, opt))
      new(
        page_number: opt[:page_number],
        page_size: opt[:page_size],
        result_count: result[:result_count],
        results: extract_results(result)
      )
    end

    class << self
      private

      def extract_results(results)
        results[results_field].map { |result| model.new(result) }
      end

      attr_accessor :end_point, :results_field, :model
    end
  end
end

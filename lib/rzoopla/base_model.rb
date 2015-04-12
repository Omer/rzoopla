module RZoopla
  class BaseModel
    def initialize(options = {})
      self.class.attributes.each do |attribute|
        instance_variable_set("@#{attribute}", options[attribute])

        self.class.send(:define_method, attribute) do
          instance_variable_get("@#{attribute}")
        end
      end
    end

    def to_hash
      Hash[*instance_variables.flat_map { |var|
        [var.to_s.delete('@'), instance_variable_get(var)]
      }]
    end

    class << self
      attr_accessor :attributes
    end
  end
end

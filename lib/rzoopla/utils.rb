module RZoopla
  module Utils
    class << self
      def pluck(hash, *args)
        Hash[hash.find_all { |k, _| args.include?(k) }]
      end

      def symbolize_keys(obj)
        case obj
        when Hash  then symbolize_keys_hash(obj)
        when Array then symbolize_keys_array(obj)
        else            obj
        end
      end

      private

      def symbolize_keys_hash(hash)
        hash.each_with_object({}) { |(key, value), result|
          result[key.respond_to?(:to_sym) ? key.to_sym : key] = \
            case value
            when Hash  then symbolize_keys_hash(value)
            when Array then symbolize_keys_array(value)
            else value
            end
        }
      end

      def symbolize_keys_array(array)
        array.map { |el|
          case el
          when Hash then symbolize_keys_hash(el)
          else el
          end
        }
      end
    end
  end
end

require 'singleton'

module MDT
  # Implements a singleton key-value data storage to be used across MDT. Uses a bit of metaprogramming for ease of use.
  class DataStorage
    include Singleton

    # Initializes the storage with empty Hash.
    def initialize
      @storage = {}
    end

    # Override method_missing to delegate to the storage hash.
    def method_missing(m, *args, &block)
      if /^(\w+)=$/ =~ m
        @storage[$1.to_sym] = args[0]
      else
        @storage[m.to_sym]
      end
    end

    # Override respond_to? to always return true as it always delegates to the hash.
    def respond_to?(method_name, include_private = false)
      true
    end
  end
end
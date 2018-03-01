require_relative '../command_modifiers'
module MDT
  # A module containing all helper classes
  module Helpers
    # A helper class to be used when implementing commands
    class Command
      # Finds and applies command modifiers to a command using passed modifiers configuration.
      # Arguments:
      # * +command+ - a command or expression to prepend command modifiers to
      # * +modifiers+ - an array of modifier configurations - each configuration is a Hash that includes the modifier type and modifier options
      # Returns:
      # * Modified command
      def self.apply_command_modifiers(command, modifiers)
        modifiers.each do |modifier_config|
          unless modifier_config.has_key?('type')
            puts 'WARNING: Skipping command modifier because of missing type...'
            next
          end
          modifier_key = modifier_config['type'].split('.').first
          modifier_value = modifier_config['type'].split('.').last
          modifier_options = modifier_config['options']
          modifier = MDT::CommandModifiers::Base.descendants.select { |cm| cm.key == modifier_key }.first
          if modifier == nil
            puts "WARNING: Could not find a command modifier set with key #{modifier_key}. Check its correctness or install needed MDT modules."
            next
          end
          unless modifier.subkeys.include?(modifier_value)
            puts "WARNING: Command modifier set with key #{modifier_key} does not have a command modifier with key #{modifier_value}."
            next
          end
          modifier = modifier.new
          command = modifier.prepend(modifier_value, command, modifier_options)
        end
        command
      end
    end
  end
end
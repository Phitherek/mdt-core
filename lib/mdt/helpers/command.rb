require_relative '../command_modifiers'
module MDT
  module Helpers
    class Command
      def apply_command_modifiers(command, modifiers)
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
            puts "WARNING: Could not find a command modifier with key #{modifier_key}. Check its correctness or install needed MDT modules."
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
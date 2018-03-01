require_relative '../commands'
module MDT
  module Helpers
    # A helper class used in the MDT executable
    class Runner
      # A method that processes an array of contents that includes configurations for commands and command groups.
      # Arguments:
      # * +contents+ - an array of configurations for commands and command groups. Refer to example configuration file in the code repository for structure description
      # * +modifiers+ - an array of configurations for command modifiers that have to be applied to every command defined in +contents+
      # Returns:
      # * 1 on failure, otherwise 0
      def self.process_contents(contents, modifiers = [])
        failure = false
        contents.each do |elem|
          unless failure
            if elem.has_key?('command')
              cmd_config = elem['command']
              cmd_config['break_on_failure'] ||= true
              cmd_config['success_codes'] ||= [0]
              unless cmd_config.has_key?('type')
                puts 'ERROR: command.type must be defined!'
                if cmd_config['break_on_failure']
                  failure = true
                  next
                end
              end
              cmd_key = cmd_config['type'].split('.').first
              cmd_value = cmd_config['type'].split('.').last
              cmd_options = cmd_config['options'] || {}
              cmd_modifiers = modifiers + (cmd_config['command_modifiers'] || [])
              cmd = MDT::Commands::Base.descendants.select { |c| c.key == cmd_key }.first
              if cmd == nil
                puts "ERROR: Could not find a command set with key #{cmd_key}. Check its correctness or install needed MDT modules."
                if cmd_config['break_on_failure']
                  failure = true
                  next
                end
              end
              unless cmd.subkeys.include?(cmd_value)
                puts "ERROR: Command set with key #{cmd_key} does not have a command with key #{cmd_value}!"
                if cmd_config['break_on_failure']
                  failure = true
                  next
                end
              end
              cmd = cmd.new
              code = cmd.execute(cmd_value, cmd_modifiers, cmd_options)
              if cmd_config['success_codes'].include?(code)
                puts "Command exited with success code #{code}"
              else
                puts "Command exited with error code #{code}"
                if cmd_config['break_on_failure']
                  failure = true
                  next
                end
              end
            elsif elem.has_key?('command_group')
              cg_config = elem['command_group']
              cg_config['break_on_failure'] ||= true
              unless cg_config.has_key?('contents')
                puts "ERROR: Command group #{cg_config['name']} without contents!"
                if cg_config['break_on_failure']
                  failure = true
                  next
                end
              end
              puts "Executing command group: #{cg_config['name']}"
              code = MDT::Helpers::Runner.process_contents(cg_config['contents'], modifiers + (cg_config['command_modifiers'] || []))
              if code == 0
                puts "Command group: #{cg_config['name']} - finished with success"
              else
                puts "Command group: #{cg_config['name']} - finished with failure"
                if cg_config['break_on_failure']
                  failure = true
                  next
                end
              end
            else
              puts 'WARNING: Encountered a config element that is not command nor command_group, skipping...'
            end
          end
        end
        failure ? 1 : 0
      end
    end
  end
end
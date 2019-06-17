require 'fastlane/action'
require_relative '../helper/start_avd_emulator_helper'

module Fastlane
  module Actions
    class StartAvdEmulatorAction < Action
      def self.run(params)
        Helper::StartAvdEmulatorHelper.check_for_environment_variable

        emulator_name = params[:name]
        emulator_list = Helper::StartAvdEmulatorHelper.get_emulator_list

        is_emulator_available = emulator_list.include? emulator_name
        if !emulator_name or !is_emulator_available
          if emulator_name and !is_emulator_available
            Helper::StartAvdEmulatorHelper.show_name_error(emulator_name)
          end
          emulator_name = Helper::StartAvdEmulatorHelper.show_emulator_selector(emulator_list)
        end

        Helper::StartAvdEmulatorHelper.start_emulator_in_background(emulator_name)
        Helper::StartAvdEmulatorHelper.show_waiting_message
        Helper::StartAvdEmulatorHelper.wait_for_emulator_to_be_started
      end

      def self.description
        "This plugin is listing available android avd emulators, allowing you to start the selected one."
      end

      def self.authors
        ["Guillaume Elloy"]
      end

      def self.details
        "Run the plugin to list all avd emulators available in your environment. "\
        "Select one to start it. "\
        "It is also possible to start one directly by specifying his name with the :name option."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :name,
                                  env_name: "START_ANDROID_EMULATOR_NAME",
                               description: "The name of the emulator to start",
                                  optional: true,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

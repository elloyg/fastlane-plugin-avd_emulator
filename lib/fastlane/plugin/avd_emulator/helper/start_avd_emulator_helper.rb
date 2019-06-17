require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class StartAvdEmulatorHelper
      def self.check_for_environment_variable
        if !ENV['ANDROID_HOME']
          error_str =
            "\n-----------------------------------------------------"\
            "\n--- $ANDROID_HOME environment variable is not set 🚨"\
            "\n-----------------------------------------------------"
          UI.user_error!(error_str)
        end
      end
      def self.show_name_error(emulator_name)
        error_str =
          "\n---------------------------------------------------"\
          "\n--- No emulator named #{emulator_name} available 🚨"\
          "\n---------------------------------------------------"
        UI.error(error_str)
      end
      def self.show_emulator_selector(emulator_list)
        select_str =
          "\n------------------------------------"\
          "\n--- Available Android emulators 📱🤖"\
          "\n------------------------------------"
        UI.select(select_str, emulator_list)
      end
      def self.show_waiting_message
        waiting_str =
          "\n---------------------------------------"\
          "\n--- Waiting for selected emulator... ☕️"\
          "\n---------------------------------------"
        UI.important(waiting_str)
      end
      def self.get_emulator_list
        `$ANDROID_HOME/tools/emulator -list-avds`.split("\n")
      end
      def self.start_emulator_in_background(emulator_name)
        system("nohup $ANDROID_HOME/tools/emulator -avd #{emulator_name} > /dev/null 2>&1 &")
      end
      def self.wait_for_emulator_to_be_started
        lines_to_trim = 2
        system("while [ `$ANDROID_HOME/platform-tools/adb devices | grep -c '^'` -le #{lines_to_trim} ] ; do sleep 1; done")
      end
    end
  end
end

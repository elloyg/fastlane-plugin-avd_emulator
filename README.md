# avd_emulator plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-avd_emulator)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-avd_emulator`, add it to your project by running:

```bash
fastlane add_plugin avd_emulator
```

Make sure to have the `$ANDROID_HOME` environment variable set.

## About avd_emulator

This plugin is listing available android avd emulators, allowing you to select and start one.
You can also start a specific AVD device with the :name option.

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Action

### start_avd_emulator

List all available AVD emulators

```ruby
start_avd_emulator # List all available AVD emulators and select one to start
start_avd_emulator(
  name: Nexus_6_x86 # Start the Nexus_6_x86 emulator if available, else list all available AVD emulators
)
```

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test` or `bundle exec fastlane test name:[emulator_name]`.

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

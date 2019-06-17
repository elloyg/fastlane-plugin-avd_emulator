describe Fastlane::Actions::AvdEmulatorAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The avd_emulator plugin is working!")

      Fastlane::Actions::AvdEmulatorAction.run(nil)
    end
  end
end

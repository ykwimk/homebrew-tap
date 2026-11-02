cask "agent-overtime" do
  version "0.3.0"
  sha256 "fdd7a89c177c3adc4cf89683576ec546c2553adf3fbc9310e6cf1f0cc69ed0bb"

  url "https://github.com/ykwimk/agent-overtime/releases/download/v#{version}/AgentOvertime-#{version}.dmg"
  name "Agent Overtime"
  desc "Pixel office showing the state of your Claude Code sessions"
  homepage "https://github.com/ykwimk/agent-overtime"

  depends_on macos: :ventura

  app "AgentOvertime.app"

  zap trash: [
    "~/Library/Application Support/AgentOvertime",
    "~/Library/Preferences/io.github.ykwimk.AgentOvertime.plist",
    "~/Library/Saved Application State/io.github.ykwimk.AgentOvertime.savedState",
  ]

  caveats <<~EOS
    The first launch is blocked because the app is not notarized.
    Open System Settings > Privacy & Security and click Open Anyway.

    Then connect Claude Code by pasting these two lines into it:
      /plugin marketplace add ykwimk/agent-overtime#v#{version}
      /plugin install agent-overtime@agent-overtime
  EOS
end

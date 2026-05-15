cask "mded" do
  version "1.0.0"
  sha256 "6ee432f88b2111b10d37283bbe92d89b7b319a6b32e814e299614247b51d8a66"

  url "https://github.com/ersatzben/mded/releases/download/v#{version}/mded-#{version}.zip"
  name "mded"
  desc "Minimal macOS markdown editor with a Finder Quick Look extension"
  homepage "https://github.com/ersatzben/mded"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "mded.app"

  zap trash: [
    "~/Library/Preferences/com.mded.app.plist",
    "~/Library/Application Support/com.mded.app",
    "~/Library/Caches/com.mded.app",
    "~/Library/Saved Application State/com.mded.app.savedState",
  ]
end

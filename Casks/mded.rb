cask "mded" do
  version "1.1.0"
  sha256 "18ebfcd983f5c3e9d19ecce32c0e124932133074fee0d7a00275ff5b96d25a28"

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

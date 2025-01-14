class TouchidSudo < Formula
  desc "CLI tool to enable Touch ID authentication for sudo on macOS"
  homepage "https://github.com/delorenj/touchid-setup"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarad/touchid-setup/releases/download/v0.1.0/touchid-setup-darwin-arm64"
      sha256 "REPLACE_WITH_ACTUAL_SHA"
    else
      url "https://github.com/jarad/touchid-setup/releases/download/v0.1.0/touchid-setup-darwin-amd64"
      sha256 "REPLACE_WITH_ACTUAL_SHA"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "touchid-setup-darwin-arm64" => "touchid-setup"
    else
      bin.install "touchid-setup-darwin-amd64" => "touchid-setup"
    end
  end

  test do
    system "#{bin}/touchid-setup", "--version"
  end
end

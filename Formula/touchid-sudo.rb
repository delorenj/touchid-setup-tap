class TouchidSudo < Formula
  desc "Beautiful CLI tool to enable Touch ID authentication for sudo on macOS"
  homepage "https://github.com/delorenj/touchid-setup"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delorenj/touchid-setup/releases/download/v0.1.0/touchid-setup-darwin-arm64"
      sha256 "363b6d589d952cebcc7a547ed7c9fd238459619471909d8d89eea510f13fbbcd"
    else
      url "https://github.com/delorenj/touchid-setup/releases/download/v0.1.0/touchid-setup-darwin-amd64"
      sha256 "611cfd3165ebc331149f7072c358c6dda52613b9eb890798e75dd4754b342fe8"
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

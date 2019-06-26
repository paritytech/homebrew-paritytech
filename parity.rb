require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.4.8'
  url 'https://releases.parity.io/ethereum/v2.4.8/x86_64-apple-darwin/parity'
  sha256 '69f1ccf4231d66949e57e5713e2adf405d29a3b42561a6c1251846f3fced03d6'

  devel do
    version '2.5.3'
    url 'https://releases.parity.io/ethereum/v2.5.3/x86_64-apple-darwin/parity'
    sha256 '136284a143ec6665f7c9ebb7d81a913120e7ec1177b0c1b29d1d2c458df42e17'
  end

  head do
    version '2.6.0'
    url 'https://releases.parity.io/ethereum/nightly/x86_64-apple-darwin/parity'
  end

  def install
    bin.install "parity"
  end

  test do
    system "#{bin}/parity", "--version"
  end

  plist_options :manual => "parity"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ThrottleInterval</key>
        <integer>300</integer>
        <key>ProgramArguments</key>
        <array>
          <string>#{prefix}/bin/parity</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end

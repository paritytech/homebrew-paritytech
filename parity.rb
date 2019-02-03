require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.2.9'
  url 'https://releases.parity.io/ethereum/v2.2.9/x86_64-apple-darwin/parity'
  sha256 '1690ea47227e45b3b67256734e3020a958c9a4b6c458fa21bbda2f55d91819ed'

  devel do
    version '2.3.2'
    url 'https://releases.parity.io/ethereum/v2.3.2/x86_64-apple-darwin/parity'
    sha256 '66afa1e9c8d6c611ff5fb20a2c62a6c2de24cd9baf5f209b6a0a97ed1aac65d3'
  end

  head do
    version '2.4.0'
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

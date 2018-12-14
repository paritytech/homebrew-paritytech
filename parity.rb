require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.1.10'
  url 'https://releases.parity.io/ethereum/v2.1.10/x86_64-apple-darwin/parity'
  sha256 'c1a977e28c9a2dacf3cd54dcfa0706b0bdbef28be728e31396bec899db9ba29a'

  devel do
    version '2.2.5'
    url 'https://releases.parity.io/ethereum/v2.2.5/x86_64-apple-darwin/parity'
    sha256 'da77f3c920bdde8ed2cd1e971130952e53532fd874df50891898822459029d1b'
  end

  head do
    version '2.3.0'
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

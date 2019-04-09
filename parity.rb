require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.4.5'
  url 'https://releases.parity.io/ethereum/v2.4.5/x86_64-apple-darwin/parity'
  sha256 '9449237292d3dd3cbe634c289670467d2b8dbdc2e3f4eeb1f11141399ab1763a'

  devel do
    version '2.5.0'
    url 'https://releases.parity.io/ethereum/v2.5.0/x86_64-apple-darwin/parity'
    sha256 '86c0db1952bafeafa832cf84010928902bfbff90e29c0f301cf5c6dd76630531'
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

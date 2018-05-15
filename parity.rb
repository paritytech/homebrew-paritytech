require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.10.4'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.4/x86_64-apple-darwin/parity'
  sha256 '8b90839270815ac5bd9c12df350329ff318828ac1ac8376df12653a89fc92000'

  devel do
    version '1.11.1'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.11.1/x86_64-apple-darwin/parity'
    sha256 '0f06846d740ae647106394d385b1f19541a0800a420466ab9a05b17ea9a21d3a'
  end

  head do
    version '1.12.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
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

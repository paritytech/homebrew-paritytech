require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.10.3'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.3/x86_64-apple-darwin/parity'
  sha256 'ddbe17126cd60b36ee96ab496768a5561d7db9b654a216198c222c2929241eca'

  devel do
    version '1.11.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.11.0/x86_64-apple-darwin/parity'
    sha256 '2bfe5048aacbed1c090d96ed2f160410ac8afb3788369d64fe7b3c88033a9b59'
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

require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.10.8'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.8/x86_64-apple-darwin/parity'
  sha256 '7cdc3236cf2514dc8506ca73cd109b04f5a6a64dac9c604a47da29ffe22962f1'

  devel do
    version '1.11.5'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.11.5/x86_64-apple-darwin/parity'
    sha256 '71dff7c2548edcc6bdccb8e288e4d4e651bd68da14f7a66925ccbbe66b263478'
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

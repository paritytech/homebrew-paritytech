require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.11.7'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.11.7/x86_64-apple-darwin/parity'
  sha256 'aeafdafc79e1247929e53696800cf7632d27535497ce4e6b77091f3181b2de29'

  devel do
    version '2.0.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v2.0.0/x86_64-apple-darwin/parity'
    sha256 'e6763a9ef2d5c2e7df3c67fe1b5c5890545a318e6a9374cc10629edb77ddf9b3'
  end

  head do
    version '2.1.0'
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

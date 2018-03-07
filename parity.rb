require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.9.5'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.5/x86_64-apple-darwin/parity'
  sha256 "fa488e6eb6faa99a5341cc55d12ef68080813f0596aeafa5728fcb176848e3ac"

  devel do
    version '1.10.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.0/x86_64-apple-darwin/parity'
    sha256 "f4cd89598abccd0f5974f4322cb772780ad5e923d166022cff3f0a406b47f540"
  end

  head do
    version '1.11.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  end

  bottle :unneeded

  def install
    bin.install "parity"
  end

  test do
    system "#{bin}/delta", "--version"
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

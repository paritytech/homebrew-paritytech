require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.10.9'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.9/x86_64-apple-darwin/parity'
  sha256 '121f4c24414e5a3788f296391f096450cb02b9fa4660c986e60bcdcf8d52f2a3'

  devel do
    version '1.11.6'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.11.6/x86_64-apple-darwin/parity'
    sha256 '1a7fa97c6d92f02c555f4c2742c16e9abd04598118dfe88b8af174d810afd88f'
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

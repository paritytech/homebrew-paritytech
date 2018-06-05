require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.10.6'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.6/x86_64-apple-darwin/parity'
  sha256 '68721d5e0420f98f5d9d3485161344cbf4d7cbd7856a2888bd2a923c524d2b14'

  devel do
    version '1.11.3'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.11.3/x86_64-apple-darwin/parity'
    sha256 '9c5a8c238069037155fcbebedd9b3eaccc288edb39ce601fb522872962272117'
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

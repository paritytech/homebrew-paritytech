require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'

  if build.include? "master" or build.include? "nightly"
    version '1.10.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  elsif build.include? "stable"
    version '1.8.11'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.8.11/x86_64-apple-darwin/parity'
    sha256 "e52e16b11f25cc8900349df04b0ce9b22bb85372029e67608153ae5ea9e02af4"
  else
    version '1.9.3'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.3/x86_64-apple-darwin/parity'
    sha256 "884082db50cdc8e763a003e1b05ea19ebfb0ef954243efe914e2a7e366033439"
  end

  option 'nightly', 'Install nightly version.'
  option 'beta', 'Install latest beta (default).'
  option 'stable', 'Install latest stable'

  bottle :unneeded

  def install
    bin.install "parity"
  end

  test do
    system "#{bin}/delta", "--version"
  end

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
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end

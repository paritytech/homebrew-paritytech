require 'formula'

class Parity < Formula
  homepage 'https://github.com/ethcore/parity'

  if build.include? "master"
    version '1.7.0'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/master/x86_64-apple-darwin/parity'
  elsif build.include? "stable"
    version '1.5.11'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.5.11/x86_64-apple-darwin/parity'
    sha256 "ce38e39f55f973894f97ed3c70a20a058f036e3ba05463dde61bf98a87edede7"
  else
    version '1.6.4'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.6.4/x86_64-apple-darwin/parity'
    sha256 "6700743239f6aa4b2b7a2d8b9a98ddab22f7362be827c4a54cccd65e74bcd692"
  end

  option 'master', 'Install nightly version.'
  option 'beta', 'Install latest beta (default). '
  option 'stable', 'Install latest stable'

  option 'geth-compatible', 'Run service with --geth option.'

  bottle :unneeded

  def install
    bin.install "parity"
  end

  test do
    system "#{bin}/delta", "--version"
  end

  def plist; <<-EOS.undent
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
          #{'<string>--geth</string>' if build.include? 'geth-compatible'}
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end

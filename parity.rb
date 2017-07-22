require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'

  if build.include? "master"
    version '1.7.0'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/master/x86_64-apple-darwin/parity'
  elsif build.include? "stable"
    version '1.6.9'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.6.9/x86_64-apple-darwin/parity'
    sha256 "CDB50A3B4E75A0D963A9D5D3168975B360A29B5E9FBC578F888A883199376652"
  else
    version '1.6.9'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.6.9/x86_64-apple-darwin/parity'
    sha256 "CDB50A3B4E75A0D963A9D5D3168975B360A29B5E9FBC578F888A883199376652"
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

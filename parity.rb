require 'formula'

class Parity < Formula
  homepage 'https://github.com/ethcore/parity'

  if build.include? "master"
    version '1.7.0'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/master/x86_64-apple-darwin/parity'
  elsif build.include? "stable"
    version '1.5.12'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.5.12/x86_64-apple-darwin/parity'
    sha256 "4f8ca0bf85ecb76f5caaec33e15bdaeda592f2f544624422ad5418d5a5ea7a0b"
  else
    version '1.6.5'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.6.5/x86_64-apple-darwin/parity'
    sha256 "65b32bd3178f442ddd9e2eb24d04ba16a6dad933f46ad7fec215900fa9358cfb"
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

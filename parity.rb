require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'

  if build.include? "master" or build.include? "nightly"
    version '1.9.0'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  elsif build.include? "beta" or build.include? "latest"
    version '1.8.4'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.8.4/x86_64-apple-darwin/parity'
    sha256 "95f9f7c84ed2a10e75dcda66f7b03a474d922bd0804f8fb4a12c88caa84f42a4"
  elsif build.include? "stable"
    version '1.7.10'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.7.10/x86_64-apple-darwin/parity'
    sha256 "6148c261ea282562246b968db2fbfd96339b6f79d131c9f92fab4048b72deb9b"
  else
    version '1.8.4'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.8.4/x86_64-apple-darwin/parity'
    sha256 "95f9f7c84ed2a10e75dcda66f7b03a474d922bd0804f8fb4a12c88caa84f42a4"
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

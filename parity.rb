require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'

  if build.include? "master" or build.include? "nightly"
    version '1.10.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  elsif build.include? "beta" or build.include? "latest"
    version '1.9.2'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.2/x86_64-apple-darwin/parity'
    sha256 "cef7c4584e17a8059256d7baf2c9c54f5617cfaf3d6cdce5d32c6ea31b39ec93"
  elsif build.include? "stable"
    version '1.8.9'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.8.9/x86_64-apple-darwin/parity'
    sha256 "eeaf4712dd4b47a438a395a6ddec5863dbc222158c484c15128c2a2e8deeb1c9"
  else
    version '1.9.2'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.2/x86_64-apple-darwin/parity'
    sha256 "cef7c4584e17a8059256d7baf2c9c54f5617cfaf3d6cdce5d32c6ea31b39ec93"
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
          #{'<string>--geth</string>' if build.include? 'geth-compatible'}
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end

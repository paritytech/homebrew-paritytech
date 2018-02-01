require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'

  if build.include? "master" or build.include? "nightly"
    version '1.10.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  elsif build.include? "beta" or build.include? "latest"
    version '1.9.1'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.1/x86_64-apple-darwin/parity'
    sha256 "7804584acfeb622df89908293d45924dd089d370c4417a7dd84e5295b210d4f5"
  elsif build.include? "stable"
    version '1.8.9'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.8.8/x86_64-apple-darwin/parity'
    sha256 "2c8750d95f16b482fe669a30333b10a1c0dcce416b42c43c97d5f42975f3c915"
  else
    version '1.9.1'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.1/x86_64-apple-darwin/parity'
    sha256 "7804584acfeb622df89908293d45924dd089d370c4417a7dd84e5295b210d4f5"
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

require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'

  if build.include? "master" or build.include? "nightly"
    version '1.10.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  elsif build.include? "beta" or build.include? "latest"
    version '1.9.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.0/x86_64-apple-darwin/parity'
    sha256 "b484ba98318cd9b725e5c7a0f94d5a76c48e560c3e97e28a009ac5ef6246fcec"
  elsif build.include? "stable"
    version '1.8.7'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.8.7/x86_64-apple-darwin/parity'
    sha256 "e6f420aad9351d60cebe32e784862cd5942ac8f3d88ca45b99424f31d43f7b19"
  else
    version '1.9.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.0/x86_64-apple-darwin/parity'
    sha256 "b484ba98318cd9b725e5c7a0f94d5a76c48e560c3e97e28a009ac5ef6246fcec"
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

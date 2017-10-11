require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'

  if build.include? "master"
    version '1.8.0'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
  elsif build.include? "stable"
    version '1.6.10'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.6.10/x86_64-apple-darwin/parity'
    sha256 "a65c24d9d1746b4c12c32db36e01839e903ec712731670ad856c6046675ce49c"
  else
    version '1.7.4'
    url 'http://d1h4xl4cr1h0mo.cloudfront.net/v1.7.3/x86_64-apple-darwin/parity'
    sha256 "d06e3a6f333bb3e41d8d31793ea72c7bd22dc73ee79a112c16604b479d9ea21a"
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

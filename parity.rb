require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.5.13'
  url 'https://releases.parity.io/ethereum/v2.5.13/x86_64-apple-darwin/parity'
  sha256 '64da3acaa2121d176f53703ee32483a8b6e330536c7bfcbf146faa192ffe5435'

  devel do
    version '2.6.8'
    url 'https://releases.parity.io/ethereum/v2.6.8/x86_64-apple-darwin/parity'
    sha256 '9b17df8b8ce56bb9b2095e39bb2a44080c6767301e7d0aa1a6d302d6958f922b'
  end

  head do
    version '2.7.0'
    url 'https://releases.parity.io/ethereum/nightly/x86_64-apple-darwin/parity'
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

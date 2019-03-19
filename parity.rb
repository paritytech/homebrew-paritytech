require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.3.6'
  url 'https://releases.parity.io/ethereum/v2.3.6/x86_64-apple-darwin/parity'
  sha256 '535421121b20b2f4783dac7d8f01667b01c5f0c3c605970c8ae365689dbaed61'

  devel do
    version '2.4.1'
    url 'https://releases.parity.io/ethereum/v2.4.1/x86_64-apple-darwin/parity'
    sha256 '1a6026c3122cf23b427eafdd1aa4c18ecfa84be299a0e31fcbb46d3fd2d2c17b'
  end

  head do
    version '2.5.0'
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

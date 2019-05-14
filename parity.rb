require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.4.6'
  url 'https://releases.parity.io/ethereum/v2.4.6/x86_64-apple-darwin/parity'
  sha256 'ddb8259333e7ebb87b483305449987d6d6d03689d244ae04e1b853eceeb50f49'

  devel do
    version '2.5.1'
    url 'https://releases.parity.io/ethereum/v2.5.1/x86_64-apple-darwin/parity'
    sha256 '17c7e7622585e0561bd810e9fb5dc2348909033545b7c1008476ef45817f059e'
  end

  head do
    version '2.6.0'
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

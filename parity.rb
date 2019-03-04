require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.3.5'
  url 'https://releases.parity.io/ethereum/v2.3.5/x86_64-apple-darwin/parity'
  sha256 'f43dcbcc60785da60748990959978a1562fd27742f94bb9b91e48bddf4a3793d'

  devel do
    version '2.4.0'
    url 'https://releases.parity.io/ethereum/v2.4.0/x86_64-apple-darwin/parity'
    sha256 '07d522594ec261ae97039e687107654cdd6bb93fd5c18a8dce1369f108d68272'
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

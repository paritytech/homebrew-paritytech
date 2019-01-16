require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.2.7'
  url 'https://releases.parity.io/ethereum/v2.2.7/x86_64-apple-darwin/parity'
  sha256 '5fc0aa2d75bd49bf62c7d8968a30801ea053660c9cbd1cdecd230a0c76d8aeaf'

  devel do
    version '2.3.0'
    url 'https://releases.parity.io/ethereum/v2.3.0/x86_64-apple-darwin/parity'
    sha256 '71822ac980ada2e4bce20c38c2f2ebb3c3d9db5e52723a1c7b0c0679bc95455b'
  end

  head do
    version '2.4.0'
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

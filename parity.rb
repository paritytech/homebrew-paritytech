require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.0.9'
  url 'https://releases.parity.io/v2.0.9/x86_64-apple-darwin/parity'
  sha256 '5259d6b14473f528b7fbb5b52838320576ff52b6c086a6152a0cdf947ba18aaf'

  devel do
    version '2.1.4'
    url 'https://releases.parity.io/v2.1.4/x86_64-apple-darwin/parity'
    sha256 '69962f6f28c6a9eb2c8e3190056f4d064034c3c719967e213f4b11b8ebd6a6d9'
  end

  head do
    version '2.2.0'
    url 'https://releases.parity.io/nightly/x86_64-apple-darwin/parity'
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

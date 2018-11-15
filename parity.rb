require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.1.6'
  url 'https://releases.parity.io/v2.1.6/x86_64-apple-darwin/parity'
  sha256 '41b87ac7a277b6025447e5dcc54193c6c46ffeb9798dbf142f3b026773a25d40'

  devel do
    version '2.2.1'
    url 'https://releases.parity.io/v2.1.6/x86_64-apple-darwin/parity'
    sha256 '0a7f77f3123524d4522f57b1e7387c5ae9e74c5f0971f84760021d8ad2b138b4'
  end

  head do
    version '2.3.0'
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

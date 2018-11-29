require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.1.7'
  url 'https://releases.parity.io/v2.1.7/x86_64-apple-darwin/parity'
  sha256 '74379e83315175ce4c24d2901d025d5ec72927f1e27408dbc4f390ab815fc8a5'

  devel do
    version '2.2.2'
    url 'https://releases.parity.io/v2.2.2/x86_64-apple-darwin/parity'
    sha256 'eb4fa2b28bb73ec55b36d525738e3c485569183b7d39c306fd87df7909b26a59'
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

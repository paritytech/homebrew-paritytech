require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.11.10'
  url 'https://releases.parity.io/v1.11.10/x86_64-apple-darwin/parity'
  sha256 '08bc9448653272b018605bd9995f4349d128e0b9243d7d567ff0c41f59366273'

  devel do
    version '2.0.3'
    url 'https://releases.parity.io/v2.0.3/x86_64-apple-darwin/parity'
    sha256 'dad7d21413daf4a8aade714af3f34e39e8998bfb7fdfda594966fadb25366720'
  end

  head do
    version '2.1.0'
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

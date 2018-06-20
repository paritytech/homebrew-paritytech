require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.10.7'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.7/x86_64-apple-darwin/parity'
  sha256 '233f0539522d2089a63d87b72ae7544222181642e92402c39b27b60e8832dd71'

  devel do
    version '1.11.4'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.11.4/x86_64-apple-darwin/parity'
    sha256 '940f2d43ded2b351115e9dd480320202f1968765b7e8e97cb556af7210e71997'
  end

  head do
    version '1.12.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
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

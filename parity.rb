require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.1.6'
  url 'https://releases.parity.io/v2.1.6/x86_64-apple-darwin/parity'
  sha256 'd3f6ed4261f283a1c774b5595cf492377c659c3a749ec0abb3d370acc9da0cd1'

  devel do
    version '2.2.1'
    url 'https://releases.parity.io/v2.2.1/x86_64-apple-darwin/parity'
    sha256 'adc27b6f7ea7d66eb012a5c2a6036e304f09ebcf2f27b04d93731618c630d840'
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

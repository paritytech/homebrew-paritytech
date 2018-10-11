require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.0.7'
  url 'https://releases.parity.io/v2.0.7/x86_64-apple-darwin/parity'
  sha256 '330883a5b4d642d36f3f40210e0f0b1450c09fa242658103fee1c756b0d82e8f'

  devel do
    version '2.1.2'
    url 'https://releases.parity.io/v2.1.2/x86_64-apple-darwin/parity'
    sha256 'd900fde7e8ac084e160ca350b765ed9c7caa30dea549adcec0783215febb6c61'
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

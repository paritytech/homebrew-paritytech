require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.1.11'
  url 'https://releases.parity.io/ethereum/v2.1.11/x86_64-apple-darwin/parity'
  sha256 '371b7992695dc09ba6757fa4d6a35084660371f08e16fb290d2b2ffd264a07dc'

  devel do
    version '2.2.6'
    url 'https://releases.parity.io/ethereum/v2.2.6/x86_64-apple-darwin/parity'
    sha256 'a0424c39bdeeeaef5fc039c51e838303b52ba11bf704bf6ef12fe381b9f6d65e'
  end

  head do
    version '2.3.0'
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

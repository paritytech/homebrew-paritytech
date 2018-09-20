require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.0.6'
  url 'https://releases.parity.io/v2.0.6/x86_64-apple-darwin/parity'
  sha256 '056b1a70869391bb8ca75729a01acd2225ff8f0a82d73807f30b4169d6771b9a'

  devel do
    version '2.1.1'
    url 'https://releases.parity.io/v2.1.1/x86_64-apple-darwin/parity'
    sha256 'defc106a3f83db4515b007a88f227a1565cad4418fe49c29e2b9b2d1531a3aad'
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

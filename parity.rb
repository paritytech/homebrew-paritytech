require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.3.8'
  url 'https://releases.parity.io/ethereum/v2.3.8/x86_64-apple-darwin/parity'
  sha256 'bddb5f34fe28db67f46c9dd844b669647c4290418464151ccff5a068d8f3ea9a'

  devel do
    version '2.4.3'
    url 'https://releases.parity.io/ethereum/v2.4.3/x86_64-apple-darwin/parity'
    sha256 '817d6287b0323d01756ff6d0cee4a84c6415bd76c3b407d37079b3cb042c777f'
  end

  head do
    version '2.5.0'
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

require 'formula'

class Parity < Formula
  version '0.9'

  homepage 'https://github.com/ethcore/parity'
  url 'https://github.com/ethcore/parity.git', :branch => 'master'

  depends_on 'multirust' => :build
  depends_on 'rocksdb'

  def install
    system "multirust update nightly"
    system "multirust run nightly cargo install --features rpc"
    bin.install "~/.multirust/toolchains/nightly/cargo/bin/parity"
  end

  def plist; <<-EOS.undent
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
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end

# Homebrew Tap for Parity

Homebrew is the missing package manager for OSX. You can find installation instructions at www.brew.sh. 

### Adding Parity to your list of Homebrew 'kegs'

Open your terminal and enter:

```bash
brew tap paritytech/paritytech
```

### Installing Parity

Simply install parity:

```
brew install parity --latest
```

This will install the latest feature-rich **beta** release. 

If you require to install **stable** version of Parity for any reason, just open your terminal and enter:

```
brew install parity --stable
```

The latest **nightly** develop releases are available via:

```
brew install parity --nightly
```

In order to update Parity to the latest stable version use:

```
brew upgrade parity
```

### Installing additional tools

Additional binaries are available via:

```bash
brew install ethabi
brew install ethkey
brew install ethstore
```

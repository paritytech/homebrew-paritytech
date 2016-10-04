# homebrew-ethcore
Homebrew Tap for ethcore.

### Getting Homebrew

Homebrew is the missing package manager for OSX. You can find installation instructions at www.brew.sh. Alternatively open your terminal and type in:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Adding Parity to your list of Homebrew 'kegs'

Open your terminal and enter:

```
brew tap ethcore/ethcore
```

### Installing Parity

If you wish to download and install the latest **stable** version of Parity (currently 1.2.4), open your terminal and enter:

```
brew install parity
```

If you would prefer to use the latest **beta** release (currently 1.3.2), open your terminal and enter:

```
brew install parity --beta
```

If you would prefer to use the latest **develop** release (currently 1.4.0), open your terminal and enter:

```
brew install parity --master
```

In order to update Parity to the latest version use:

```
brew update && brew upgrade
```

and

```
brew reinstall parity
```

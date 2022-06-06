# Custom Cursor Colors

This is a fork of [Kaiz Khatri](https://github.com/ful1e5)'s [Bibata Cursors](https://github.com/ful1e5/Bibata_Cursor) project.  
 
Bibata is an **OpenSource**, compact, and material designed cursor set. This fork lets you generate custom cursors with your color(s) of choice. 

## tldr;
0) Git clone this repo
1) Install dependencies on a Fedora [distrobox](https://github.com/89luca89/distrobox) or laptop
2) Modify ./bitmapper/src/config.ts with your desired colors 
3) Run **make** to build the cursors
4) See Install section below, depends on your system 

## Bibata Styles

- **Bibata Original :** Sharp edge Bibata Cursors
- **Bibata Modern :** Round edge Bibata Cursors

## Cursor Sizes

<kbd>22</kbd>
<kbd>24</kbd>
<kbd>28</kbd>
<kbd>32</kbd>
<kbd>40</kbd>
<kbd>48</kbd>
<kbd>56</kbd>
<kbd>64</kbd>
<kbd>72</kbd>
<kbd>80</kbd>
<kbd>88</kbd>
<kbd>96</kbd>

## Preview

> Check Figma file [here](https://www.figma.com/file/Y9RKZLXhSvaxpUzsKGJkp6/Bibata-Cursor?node-id=0%3A1)

<p align="center">
  <img title="Bibata Classic" width="90%" src="https://i.imgur.com/C8mMQ3j.png">
  </br>
  <sub>Bibata Classic</sub>
</p>

## Dependencies (on Fedora)

```bash
sudo dnf install gcc make nodejs python3 python3-pip 
sudo dnf install libX11-devel libXcursor-devel libpng-devel
npm install puppeteer 
npm install pngjs
npm install pixelmatch
pip3 install clickgen
sudo npm install -g yarn
#sudo apt remove chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra
#https://docs.fedoraproject.org/en-US/quick-docs/installing-chromium-or-google-chrome-browsers/
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable
```

## Customization

Specify 10 Hex codes for colors in **[bitmapper/src/config.ts](./bitmapper/src/config.ts)**
Used the [Solarized](https://ethanschoonover.com/solarized/) color palette by default

## Build

> Check **[Makefile](./Makefile)** for more targets.

```bash
make
```

#### Build Only `XCursor` theme

```bash
make unix
```

#### Customize `XCursor` size

```bash
make unix X_SIZES=22            # Only built '22px' pixel-size.
make unix X_SIZES=22 24 32      # Multiple sizes are provided with  ' '(Space)
```

#### Install `XCursor` theme

```bash
make install            # install as user
  # OR
sudo make install       # install as root
```

#### Build Only `Windows` theme

```bash
make windows
```

#### Customize `Windows Cursor` size

```bash
make windows WIN_SIZE=96            # Supports only one pixel-size
```

## Install

#### Linux/X11

```bash
# extract `Bibata.tar.gz`
tar -xvf Bibata.tar.gz

# For local users
mv Bibata-* ~/.icons/

# For all users
sudo mv Bibata-* /usr/share/icons/
```

#### Windows

1. unzip `.zip` file
2. Open unziped directory in Explorer, and **right click** on `install.inf`.
3. Click 'Install' from the context menu, and authorize the modifications to your system.
4. Open _Control Panel_ > _Personalization and Appearance_ > _Change mouse pointers_, and select **Bibata Cursors**.
5. Click '**Apply**'.

### Uninstall

#### Linux/X11

```bash
# From local users
rm ~/.icons/Bibata-*

# From all users
sudo rm /usr/share/icons/Bibata-*
```

#### Windows

1. Go to **Registry Editor** by typing the same in the _start search box_.
2. Expand `HKEY_CURRENT_USER` folder and expand `Control Panel` folder.
3. Go to `Cursors` folder and click on `Schemes` folder - all the available custom cursors that are installed will be listed here.
4. **Right Click** on the name of cursor file you want to uninstall; for eg.: _Bibata Cursors_ and click `Delete`.
5. Click '**yes**' when prompted.

# Credit

- [Kaiz Khatri](https://github.com/ful1e5) 

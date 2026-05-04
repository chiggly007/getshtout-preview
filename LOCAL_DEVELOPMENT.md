# Local Development Guide

This guide gets the Get SHT Out website running on your computer for the first time.

The site is plain HTML, CSS, and JavaScript. There is no build step, package install, or framework setup.

## 1. Install the basics

You need:

- Git
- Python 3
- A web browser

Check whether they are already installed:

```bash
git --version
python3 --version
```

If either command fails, install Git and Python 3 first. On macOS, installing Xcode Command Line Tools usually handles Git:

```bash
xcode-select --install
```

## 2. Clone the repo

Choose a folder where you keep projects, then run:

```bash
git clone https://github.com/chiggly007/getshtout.git
cd getshtout
```

## 3. Start the local server

From inside the `getshtout` folder, run:

```bash
python3 -m http.server 8765
```

Leave that terminal window open. You should see output showing that Python is serving files.

## 4. Open the website

Open this URL in your browser:

```text
http://localhost:8765
```

If you make changes to the files, refresh the browser page to see them.

## 5. Stop the server

Go back to the terminal window running the server and press:

```text
Control + C
```

## Common issues

### Port already in use

If port `8765` is busy, run the server on another port:

```bash
python3 -m http.server 8080
```

Then open:

```text
http://localhost:8080
```

### Browser shows an old version

Do a hard refresh:

- macOS Chrome: `Command + Shift + R`
- Windows Chrome: `Control + Shift + R`

You can also add a cache-busting query string:

```text
http://localhost:8765/?v=2
```

### You are in the wrong folder

The server command must be run from the folder that contains `index.html`.

Check with:

```bash
ls
```

You should see:

```text
index.html
styles.css
script.js
assets
```

## What to edit

- `index.html` - page content, headings, links, and form labels
- `styles.css` - colors, layout, typography, spacing, and responsive styles
- `script.js` - quote form behavior
- `assets/hero-junk-removal.png` - main hero image

## Git workflow

Before changing files, pull the latest version:

```bash
git pull
```

After editing, see what changed:

```bash
git status
git diff
```

Commit your changes:

```bash
git add .
git commit -m "Describe your change"
git push
```

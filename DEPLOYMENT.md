# Deployment Guide

The site is hosted with GitHub Pages from the public repo:

```text
https://github.com/chiggly007/getshtout
```

GitHub Pages publishes from:

```text
branch: main
folder: /
domain: getshtout.com
```

## Fast Deploy

After editing locally, run:

```bash
./scripts/deploy.sh "Describe the change"
```

The script will:

- commit local changes
- push to GitHub
- wait for the latest GitHub Pages build
- print a fresh cache-busted URL

Example:

```bash
./scripts/deploy.sh "Refresh brand voice and logo"
```

Then open the printed URL, which will look like:

```text
http://getshtout.com/?v=abc1234
```

The `?v=abc1234` part helps bypass browser cache after a new deploy.

## If The Site Still Shows GoDaddy

That means DNS is still cached somewhere between your browser and GoDaddy. The authoritative GoDaddy DNS records already point to GitHub Pages, but some resolvers can hold the old answer for a while.

Check DNS:

```bash
dig getshtout.com A
dig @8.8.8.8 getshtout.com A
dig @ns11.domaincontrol.com getshtout.com A
```

Correct GitHub Pages IPs:

```text
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

## After DNS Settles

Go to GitHub Pages settings and enable HTTPS:

```text
https://github.com/chiggly007/getshtout/settings/pages
```

Turn on:

```text
Enforce HTTPS
```

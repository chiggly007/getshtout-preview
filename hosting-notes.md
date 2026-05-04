# Hosting Recommendation

## Best Starting Setup

Use GitHub Pages from the public `chiggly007/getshtout` repository.

Why:

- This site is static HTML/CSS/JS, so it does not need a server.
- GitHub Pages is available for public repositories on GitHub Free.
- The repository can be the source of truth, and every push to `main` can publish the site.
- The `CNAME` file points GitHub Pages at `getshtout.com`.
- The `.nojekyll` file tells GitHub to serve the static files directly.

Deployment settings:

- Source: Deploy from a branch
- Production branch: `main`
- Folder: `/root`

Custom domain:

- Repository Pages custom domain: `getshtout.com`
- DNS apex `A` records should point to GitHub Pages:
  - `185.199.108.153`
  - `185.199.109.153`
  - `185.199.110.153`
  - `185.199.111.153`
- DNS `www` record should be a `CNAME` pointing to `chiggly007.github.io`.
- After DNS propagates, enable `Enforce HTTPS` in repository Settings > Pages.

Primary references:

- GitHub Pages overview: https://docs.github.com/articles/user-organization-and-project-pages
- GitHub Pages publishing source: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
- GitHub Pages custom domain DNS: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site

## Cloud Provider Credits

For this exact website, do not spend cloud credits. Static hosting is the right tool.

For the case-study/business experiment, Google Cloud is the best sandbox because new customers get a $300 free trial credit for about 90 days/91 days depending on the program page, plus always-free product tiers. Use it later for experiments like:

- a quote intake API
- photo upload storage
- lead tracking in a small database
- call/text automation
- analytics export to BigQuery

AWS is a reasonable second choice for learning because newer free-tier accounts can receive up to $200 in credits over a six-month free account plan. It is more infrastructure-heavy for a simple service-business landing page.

Azure is useful if you specifically want the Microsoft ecosystem, but it is not the simplest first move for this static launch.

Credit references:

- Google Cloud Free Program: https://cloud.google.com/free/docs/free-cloud-features
- AWS Free Tier credits announcement: https://aws.amazon.com/about-aws/whats-new/2025/07/aws-free-tier-credits-month-free-plan
- Microsoft Azure free account: https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account

## Practical Launch Path

1. Push this project to `chiggly007/getshtout`.
2. Enable GitHub Pages from `main` and `/root`.
3. Set the custom domain to `getshtout.com`.
4. Add the DNS records listed above wherever the domain is managed.
5. Wait for DNS propagation, then enable HTTPS.
6. Replace the placeholder phone/email once you have the intake channel ready.

## Next Upgrade

When you want the quote form to submit without opening email, add a lightweight backend:

- Cloudflare Pages Function for form handling
- Turnstile spam protection
- Email routing to `hello@getshtout.com`
- Optional storage in Google Sheets, Airtable, or Cloudflare D1

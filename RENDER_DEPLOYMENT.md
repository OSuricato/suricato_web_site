# 🚀 Render Deployment Guide

## Quick Deploy to Render

### 1. Prepare Your Repository

Make sure your code is pushed to GitHub, GitLab, or Bitbucket.

```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

### 2. Environment Variables

In your Render dashboard, add these environment variables:

#### Required Variables

```bash
# Rails Master Key (CRITICAL - get this from config/master.key)
RAILS_MASTER_KEY=<paste your master key here>

# Rails Environment
RAILS_ENV=production

# Enable static file serving
RAILS_SERVE_STATIC_FILES=true

# Log to stdout
RAILS_LOG_TO_STDOUT=true

# Secret key base (generate with: rails secret)
SECRET_KEY_BASE=<generate with rails secret command>
```

#### How to Get Your RAILS_MASTER_KEY

```bash
# In your project directory, run:
cat config/master.key
```

Copy the output and paste it as the value for `RAILS_MASTER_KEY` in Render.

#### Generate SECRET_KEY_BASE

```bash
# In your project directory, run:
rails secret
```

Copy the output and use it for `SECRET_KEY_BASE`.

### 3. Create Web Service on Render

1. Go to https://dashboard.render.com
2. Click **"New +"** → **"Web Service"**
3. Connect your repository
4. Configure the service:

   **Name**: `suricato-web`
   
   **Region**: Choose closest to your users (e.g., Oregon, Frankfurt, São Paulo)
   
   **Branch**: `main` (or your default branch)
   
   **Root Directory**: Leave blank
   
   **Runtime**: `Ruby`
   
   **Build Command**:
   ```bash
   bundle install && npm install && npm run build && npm run build:css && bundle exec rails assets:precompile && bundle exec rails db:migrate
   ```
   
   **Start Command**:
   ```bash
   bundle exec rails server -b 0.0.0.0 -p $PORT
   ```
   
   **Plan**: Free (or paid for better performance)

5. Click **"Advanced"** and add all environment variables from step 2

6. Click **"Create Web Service"**

### 4. Monitor Deployment

Render will:
- Install Ruby gems
- Install Node packages
- Build JavaScript assets
- Build CSS with Tailwind
- Precompile Rails assets
- Create SQLite database
- Start the server

Your site will be live at: `https://suricato-web.onrender.com`

## 🔧 Build Commands Explained

```bash
# Install Ruby dependencies
bundle install

# Install Node dependencies (Tailwind, Flowbite, AOS)
npm install

# Build JavaScript with esbuild
npm run build

# Build CSS with Tailwind
npm run build:css

# Precompile Rails assets
bundle exec rails assets:precompile

# Run database migrations
bundle exec rails db:migrate
```

## 📊 Database

The site uses **SQLite3** - a file-based database that works perfectly on Render for static/read-only sites. The database file is stored in `storage/production.sqlite3`.

### Important Notes about SQLite on Render

⚠️ **Warning**: Free Render instances restart periodically and **database changes will be lost**.

For a production site with no dynamic data (like this marketing site), this is fine since all content is in the code.

If you need persistent data, consider:
- Upgrading to a paid Render plan with disk persistence
- Using PostgreSQL (requires changing `config/database.yml` back)

## 🎨 Custom Domain

1. In Render dashboard, go to your service
2. Click **"Settings"** → **"Custom Domain"**
3. Add your domain (e.g., `suricato.web` or `www.suricato.web`)
4. Update your DNS records as instructed by Render
5. SSL certificate is automatically provisioned

## 🔄 Automatic Deploys

Render automatically redeploys when you push to your main branch:

```bash
git add .
git commit -m "Update content"
git push origin main
```

## 🐛 Troubleshooting

### Build Fails

**Check logs** in Render dashboard → "Logs" tab

Common issues:
- Missing `RAILS_MASTER_KEY`: Add it in Environment Variables
- Node/npm errors: Ensure `package.json` has all dependencies
- Asset compilation fails: Check Tailwind config

### Site Loads but Looks Broken

**Styles not loading**: Ensure build commands ran successfully
```bash
npm run build:css
bundle exec rails assets:precompile
```

**Accordion not working**: Check JavaScript built correctly
```bash
npm run build
```

### Database Errors

If you see database errors, run migrations manually:
```bash
# In Render shell (available in dashboard)
bundle exec rails db:migrate
```

## 📈 Performance Tips

### Free Tier Limitations
- Instance spins down after 15 minutes of inactivity
- First request after spin-down is slow (~30-60 seconds)

### Upgrade for Better Performance
- **Starter plan ($7/month)**: Faster, always-on
- **Standard plan**: Even better performance + disk persistence

### Optimize Load Time
- Images are already optimized in code
- Tailwind CSS is purged (only used classes)
- JavaScript is bundled and minified

## 🔐 Security Checklist

✅ Never commit `config/master.key` to git (it's in `.gitignore`)
✅ Use environment variables for all secrets
✅ Enable HTTPS (automatic with Render)
✅ Keep dependencies updated

## 📞 Support

If you encounter issues:
1. Check Render logs
2. Review this guide
3. Check `README_SURICATO.md` for site documentation
4. Contact Render support: https://render.com/support

---

**Your site should be live at**: `https://suricato-web.onrender.com` (or your custom domain)

**Deploy time**: ~5-10 minutes for first deploy, ~2-3 minutes for subsequent deploys

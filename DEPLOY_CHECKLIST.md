# ✅ Render Deployment Checklist

## Before Deploying

- [ ] All code committed and pushed to GitHub/GitLab/Bitbucket
- [ ] Images added to `app/assets/images/cases/`
- [ ] Content reviewed in `config/locales/pt-BR.yml`
- [ ] Tested locally at `http://localhost:3000`

## Render Setup

### 1. Get Your Keys

```bash
# Get Rails master key
cat config/master.key

# Generate secret key base
rails secret
```

### 2. Environment Variables (Copy to Render)

```bash
RAILS_MASTER_KEY=<paste from config/master.key>
SECRET_KEY_BASE=<paste from rails secret>
RAILS_ENV=production
RAILS_SERVE_STATIC_FILES=true
RAILS_LOG_TO_STDOUT=true
```

### 3. Build Command

```bash
bundle install && npm install && npm run build && npm run build:css && bundle exec rails assets:precompile && bundle exec rails db:migrate
```

### 4. Start Command

```bash
bundle exec rails server -b 0.0.0.0 -p $PORT
```

## After Deployment

- [ ] Site loads at your Render URL
- [ ] All pages work (Home, Trabalhos, Sobre, Contato)
- [ ] Images show correctly
- [ ] Accordions are clickable
- [ ] Mobile view works
- [ ] Check Lighthouse score

## If Something Goes Wrong

1. **Check Render Logs** → Dashboard → Logs tab
2. **Rebuild** → Dashboard → Manual Deploy
3. **Review** → `RENDER_DEPLOYMENT.md` for troubleshooting

## Quick Deploy Command

```bash
git add .
git commit -m "Update site"
git push origin main
```

Render auto-deploys! ⚡

---

**Need help?**
- Full guide: `RENDER_DEPLOYMENT.md`
- Image guide: `ADDING_IMAGES.md`
- Site docs: `README_SURICATO.md`

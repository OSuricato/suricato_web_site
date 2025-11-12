# 📸 Adding Images to Your Site

## 📁 Directory Structure

All images should be placed in:
```
app/assets/images/
```

This is already where your `logo.png` lives!

## 🎯 Where to Add Images

### 1. **Case Study Thumbnails** (Work Page Grid)

**Location**: Work page at `/trabalhos`

**Directory**: `app/assets/images/cases/`

**Files needed** (8 thumbnails):
```
app/assets/images/cases/
├── polegatch-ride.jpg
├── madonna-cafe.jpg
├── aasports.jpg
├── watchbikes.jpg
├── treino-facil.jpg
├── werace.jpg
├── almora-botanica.jpg
└── associacao-kb.jpg
```

**Recommended size**: 800x600px (4:3 ratio) or 1200x900px for retina

**How to add**:

Edit `app/views/pages/work.html.erb` around line 82-91:

Replace this:
```erb
<div class="aspect-video bg-gradient-to-br from-steel/20 to-steel/10 rounded-xl">
  <!-- Placeholder -->
</div>
```

With this:
```erb
<div class="aspect-video rounded-xl overflow-hidden">
  <%= image_tag "cases/#{project[:slug]}.jpg", 
      alt: project[:title], 
      class: "w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" %>
</div>
```

---

### 2. **Case Study Detail Pages** (Individual Project Pages)

**Location**: Case study pages at `/trabalhos/:slug`

**Directory structure**:
```
app/assets/images/cases/
├── polegatch-ride/
│   ├── hero.jpg          (main header image)
│   ├── screenshot-1.jpg
│   ├── screenshot-2.jpg
│   ├── screenshot-3.jpg
│   └── screenshot-4.jpg
├── madonna-cafe/
│   ├── hero.jpg
│   └── ...
└── (repeat for all 8 projects)
```

**Recommended sizes**:
- **Hero image**: 1920x1080px (16:9 ratio)
- **Screenshots**: 1600x900px or 1200x675px

**How to add hero image**:

Edit `app/views/pages/case_study.html.erb` around line 28-38:

Replace placeholder with:
```erb
<div class="aspect-video rounded-2xl overflow-hidden">
  <%= image_tag "cases/#{@slug}/hero.jpg", 
      alt: @case_study[:title], 
      class: "w-full h-full object-cover" %>
</div>
```

**How to add screenshots**:

Replace the 4 placeholder loops (around line 165-180) with:
```erb
<% 4.times do |i| %>
  <div class="aspect-video rounded-xl overflow-hidden" data-aos="fade-up" data-aos-delay="<%= i * 100 %>">
    <%= image_tag "cases/#{@slug}/screenshot-#{i + 1}.jpg", 
        alt: "#{@case_study[:title]} - Screenshot #{i + 1}", 
        class: "w-full h-full object-cover hover:scale-105 transition-transform duration-300" %>
  </div>
<% end %>
```

---

### 3. **Logo / Favicon** (Already Done! ✅)

**Location**: Navbar, Footer, Browser Tab

**File**: `app/assets/images/logo.png` (already in place)

The logo is already configured and showing as:
- Navbar logo
- Footer logo
- Browser favicon
- Apple touch icon

---

## 🖼️ Image Optimization Tips

### Before uploading images:

1. **Compress images** using:
   - [TinyPNG](https://tinypng.com/) - Free online compression
   - [ImageOptim](https://imageoptim.com/) - Mac app
   - [Squoosh](https://squoosh.app/) - Google's tool

2. **Use WebP format** (better compression):
   ```bash
   # Convert JPG to WebP (if you have cwebp installed)
   cwebp -q 80 input.jpg -o output.webp
   ```

3. **Right dimensions**:
   - Don't upload 4000px images for 800px display
   - Use 2x for retina (e.g., 1600px image for 800px display)

### Batch resize images (Mac/Linux):

```bash
# Install ImageMagick
brew install imagemagick

# Resize all JPGs to max width 1600px
mogrify -resize 1600x\> *.jpg
```

---

## 📝 Quick Reference: File Paths

| Image Type | Path | Recommended Size |
|------------|------|------------------|
| Logo | `app/assets/images/logo.png` | 512x512px |
| Case thumbnails | `app/assets/images/cases/[slug].jpg` | 800x600px |
| Case hero | `app/assets/images/cases/[slug]/hero.jpg` | 1920x1080px |
| Case screenshots | `app/assets/images/cases/[slug]/screenshot-[1-4].jpg` | 1600x900px |

---

## ⚡ After Adding Images

### 1. Restart your server
```bash
# Stop server (Ctrl+C)
# Restart
bin/rails server
```

### 2. Rebuild assets for production
```bash
npm run build
npm run build:css
bundle exec rails assets:precompile
```

### 3. Commit and deploy
```bash
git add app/assets/images/
git commit -m "Add project images"
git push origin main
```

Render will automatically deploy with your new images!

---

## 🎨 Image Guidelines

### For Best Results:

**✅ DO:**
- Use high-quality images
- Maintain consistent aspect ratios
- Compress before uploading
- Use descriptive filenames
- Test on mobile and desktop

**❌ DON'T:**
- Use extremely large files (>2MB)
- Mix portrait and landscape randomly
- Use low-resolution images
- Forget alt text (accessibility)

---

## 🔍 Testing Your Images

After adding images, test:

1. **Work page**: Visit `/trabalhos` - all thumbnails show
2. **Case studies**: Click each project - hero and screenshots show
3. **Mobile**: Check images scale correctly
4. **Load time**: Images should load quickly (<2 seconds)

---

## 📞 Troubleshooting

### Images not showing?

1. **Check file path** - must be in `app/assets/images/`
2. **Check filename** - must match exactly (case-sensitive!)
3. **Restart server** - Rails caches asset paths
4. **Check file permissions** - files should be readable

### Images show in development but not production?

1. **Precompile assets**:
   ```bash
   RAILS_ENV=production bundle exec rails assets:precompile
   ```

2. **Push to git** - Render needs the files in repository:
   ```bash
   git add app/assets/images/
   git push origin main
   ```

---

## 🎉 You're Done!

Once you add images to `app/assets/images/cases/`, they'll automatically appear on your site!

**Need help?** Check `README_SURICATO.md` for more documentation.

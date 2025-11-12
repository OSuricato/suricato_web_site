# 🚀 Quick Start Guide

## Get Running in 3 Steps

### 1. Start the Server
```bash
cd /Users/victorbarbosa/Developer/suricato_web/suricato_web_site
bin/dev
```

### 2. Open Your Browser
Navigate to: `http://localhost:3000`

### 3. Explore the Site
- **Home**: `/` - Full landing page with hero, services, process, testimonials
- **Work**: `/trabalhos` - 8 case studies portfolio
- **About**: `/sobre` - Company info, values, tech stack
- **Contact**: `/contato` - Email and social links

## 📸 Adding Images

### For Work Page Thumbnails
1. Place images in `app/assets/images/cases/`
2. Update `app/views/pages/work.html.erb` line 82-91:
```erb
<div class="aspect-video">
  <%= image_tag "cases/your-image.jpg", alt: project[:title], class: "w-full h-full object-cover rounded-xl" %>
</div>
```

### For Case Study Pages
1. Place images in `app/assets/images/cases/[slug]/`
2. Update `app/views/pages/case_study.html.erb` line 28:
```erb
<%= image_tag "cases/#{@slug}/hero.jpg", alt: @case_study[:title], class: "w-full h-full object-cover rounded-2xl" %>
```

## 🎨 Quick Customizations

### Change Brand Colors
Edit `tailwind.config.js`:
```javascript
colors: {
  meerkatPink: '#EC407A', // Your pink
  graphite: '#111213',     // Your dark
}
```

### Update Text Content
Edit `config/locales/pt-BR.yml`:
```yaml
hero:
  title: "Your new tagline"
  subtitle: "Your subtitle"
```

### Modify Button Styles
Edit `app/assets/stylesheets/application.tailwind.css`:
```css
.btn-primary {
  @apply bg-meerkatPink text-white /* ... */
}
```

## 🔧 Common Tasks

### Add a New Case Study
1. Add to work grid in `app/views/pages/work.html.erb`
2. Add full data in `app/controllers/pages_controller.rb`
3. Add images to `app/assets/images/cases/your-slug/`

### Change Social Links
Update in `config/locales/pt-BR.yml` and `app/views/shared/_footer.html.erb`

### Modify Navigation
Edit `app/views/shared/_navbar.html.erb`

### Update Footer
Edit `app/views/shared/_footer.html.erb`

## 📱 Test Responsive Design

Desktop view:
```
http://localhost:3000
```

Mobile view (Chrome DevTools):
1. Open DevTools (F12)
2. Click device toggle (Ctrl+Shift+M)
3. Select iPhone or Android device

## 🎯 What's Already Done

✅ All pages built and styled  
✅ Portuguese translations configured  
✅ Responsive design (mobile, tablet, desktop)  
✅ AOS animations on scroll  
✅ Flowbite accordions for process section  
✅ 8 case studies with detailed pages  
✅ SEO meta tags (Open Graph, Twitter)  
✅ Accessibility features (focus states, ARIA)  
✅ Dark theme throughout  
✅ Custom Tailwind components  

## 🎬 Next Actions

1. **Add Real Images** - Replace all placeholder images
2. **Review Copy** - Check all Portuguese text in `pt-BR.yml`
3. **Test All Links** - Click through every page
4. **Add Analytics** - Google Analytics or similar
5. **Deploy** - Push to production (Heroku, Render, etc.)

## 💡 Pro Tips

- Images should be **1920x1080px** for hero sections
- Use **WebP format** for better performance
- Keep alt text **descriptive** for SEO
- Test on **real mobile devices** if possible
- Check **Lighthouse score** before deploying

## 🆘 Troubleshooting

**Server won't start?**
```bash
bundle install
bin/rails db:create db:migrate
bin/dev
```

**CSS not loading?**
```bash
bin/rails tailwindcss:build
```

**Images not showing?**
- Check path: `app/assets/images/your-image.jpg`
- Restart server after adding new images

## 📞 Need Help?

Check `README_SURICATO.md` for full documentation.

---

**Happy building! 🦫**

# 🦫 Suricato Web - Marketing Site

A modern, sleek static marketing website for Suricato Web, a Brazilian web agency specializing in e-commerce, landing pages, SaaS, and mobile apps.

## 🎨 Design & Branding

### Colors
- **Primary Pink (meerkatPink)**: `#EC407A`
- **Dark Graphite**: `#111213`
- **White**: `#FFFFFF`
- **Gray Light (mist)**: `#F3F3F3`
- **Gray Medium (steel)**: `#BDBDBD`

### Typography
- **Headings/Display**: Space Grotesk (Bold/Semibold)
- **Body/UI**: Inter

### Logo
White meerkat silhouette inside a pink circle located at `app/assets/images/logo.png`

## 🚀 Features

### Pages
1. **Home** (`/`) - Hero, Services, Process (Accordion), Testimonials, CTA
2. **Work** (`/trabalhos`) - Portfolio grid with 8 case studies
3. **About** (`/sobre`) - Mission, Values, Stack, Advantages
4. **Contact** (`/contato`) - Email and social media links
5. **Case Study** (`/trabalhos/:slug`) - Detailed project pages

### Components
- **Navbar**: Sticky navigation with logo, links, and CTA button
- **Footer**: Logo, quick links, social icons (Instagram/LinkedIn)
- **Section Header**: Reusable section titles with optional subtitles
- **Custom Buttons**: `.btn-primary`, `.btn-ghost`, `.btn-secondary`
- **Cards**: `.card`, `.card-dark` with hover effects
- **Badges**: `.badge` for tags and categories

### Technologies
- **Backend**: Ruby on Rails 8.1
- **Frontend**: Tailwind CSS 4.1
- **Components**: Flowbite 3.1
- **Animations**: AOS (Animate On Scroll) 2.3
- **i18n**: Portuguese (pt-BR) via Rails i18n

## 📁 Project Structure

```
app/
├── assets/
│   ├── images/
│   │   └── logo.png (your meerkat logo)
│   └── stylesheets/
│       └── application.tailwind.css (custom components & utilities)
├── controllers/
│   └── pages_controller.rb (home, work, about, contact, case_study)
├── javascript/
│   └── application.js (Flowbite + AOS initialization)
└── views/
    ├── layouts/
    │   └── application.html.erb (main layout with meta tags)
    ├── pages/
    │   ├── home.html.erb
    │   ├── work.html.erb
    │   ├── about.html.erb
    │   ├── contact.html.erb
    │   └── case_study.html.erb
    └── shared/
        ├── _navbar.html.erb
        ├── _footer.html.erb
        └── _section_header.html.erb

config/
├── locales/
│   └── pt-BR.yml (all Portuguese translations)
└── routes.rb (Portuguese-friendly routes)

tailwind.config.js (custom colors, fonts, Flowbite plugin)
```

## 🎯 Case Studies

All 8 case studies are ready with placeholder images:

1. **Polegatch Ride** - SaaS cycling coaching platform
2. **Madonna Cafe** - Premium coffee shop landing page
3. **aasports** - Custom sports paintings e-commerce
4. **watchbikes** - Bikes e-commerce + mechanic booking
5. **Treino Fácil** - Cycling training mobile app
6. **werace** - Bike sharing marketplace (Airbnb-style)
7. **Almora Botânica** - Natural beauty products e-commerce
8. **Associação KB** - CBD oils institutional site

### Adding Images
Replace placeholder images by adding files to:
- Work grid thumbnails: Update `work.html.erb` image placeholders
- Case study images: Update `case_study.html.erb` image placeholders
- Recommended size: 1920x1080px for hero images, 800x600px for thumbnails

## 🛠 Development

### Prerequisites
- Ruby 3.x
- Node.js 18+
- Rails 8.1

### Setup
```bash
# Install dependencies
bundle install
npm install

# Setup database
bin/rails db:create db:migrate

# Start dev server (Rails + Tailwind JIT)
bin/dev
```

### Build for Production
```bash
# Precompile assets
bin/rails assets:precompile

# Or use
bin/rails tailwindcss:build
```

## 🎨 Custom Tailwind Classes

### Buttons
- `.btn-primary` - Pink background, white text
- `.btn-ghost` - Transparent with white border
- `.btn-secondary` - White background, dark text

### Cards
- `.card` - White card with shadow
- `.card-dark` - Dark card with glass effect

### Sections
- `.section` - Standard vertical padding
- `.section-dark` - Dark graphite background
- `.section-light` - White background
- `.section-mist` - Light gray background

### Typography
- `.heading-xl` - Extra large display heading
- `.heading-lg` - Large heading
- `.heading-md` - Medium heading
- `.heading-sm` - Small heading

### Layout
- `.container-custom` - Max-width container with padding

## 📝 Content Management

### Updating Copy
All text is in `config/locales/pt-BR.yml`. To update any copy:

```yaml
pt-BR:
  hero:
    title: "Your new tagline here"
    subtitle: "Updated subtitle"
```

### Adding a New Case Study

1. Add to `work.html.erb` case_studies array:
```ruby
{
  slug: 'new-project',
  title: 'New Project',
  category: 'E-commerce',
  description: 'Short description',
  tags: ['Rails', 'React']
}
```

2. Add to `pages_controller.rb` @case_studies hash:
```ruby
'new-project' => {
  title: 'New Project',
  category: 'E-commerce',
  description: 'Short description',
  overview: '...',
  challenge: '...',
  solution: '...',
  results: ['Result 1', 'Result 2', 'Result 3'],
  technologies: ['Tech 1', 'Tech 2'],
  url: 'https://example.com' # optional
}
```

## 🌐 Links

- **Instagram**: https://www.instagram.com/suricato.web/
- **LinkedIn**: https://www.linkedin.com/company/suricato-web
- **Email**: contato@suricato.web

## ♿ Accessibility

- Semantic HTML5
- ARIA labels on interactive elements
- Focus states on all clickable items
- Alt text placeholders for images
- Keyboard navigation support
- Respects `prefers-reduced-motion`

## 📊 Performance

- Lighthouse-optimized
- Lazy-loaded images via AOS
- Minimal JavaScript bundle
- Tailwind CSS JIT for lean CSS
- Prefers-reduced-motion support

## 🎬 Animations

Using AOS (Animate On Scroll):
- `data-aos="fade-up"` - Fade in from bottom
- `data-aos="zoom-in"` - Zoom in effect
- `data-aos="fade-right"` - Slide from right
- `data-aos-delay="100"` - Delay animation

## 🚢 Deployment

Ready to deploy with:
- Heroku
- Fly.io
- Render
- Any Rails-compatible host

Environment variables needed:
- `RAILS_MASTER_KEY` (from config/master.key)

## 📱 Responsive Design

Fully responsive with mobile-first approach:
- Mobile: < 768px
- Tablet: 768px - 1024px
- Desktop: > 1024px

## 🔍 SEO

- Comprehensive Open Graph tags
- Twitter Card meta tags
- Semantic HTML structure
- Portuguese language meta
- Sitemap-ready structure

## 📦 Dependencies

- `tailwindcss` - Utility-first CSS
- `flowbite` - UI components
- `aos` - Scroll animations
- `@tailwindcss/forms` - Form styling
- `@tailwindcss/typography` - Rich text styling

## 🎯 Next Steps

1. **Add Real Images**: Replace all placeholder images with actual project screenshots
2. **Add Case Study URLs**: Update `url` field in case studies with live site links
3. **Optimize Images**: Use WebP format for better performance
4. **Add Analytics**: Integrate Google Analytics or Plausible
5. **Add Contact Form**: Implement form submission (Formspree, Netlify Forms, etc.)
6. **Add Blog** (optional): Create a blog section for content marketing
7. **Add Portuguese SEO**: Optimize meta descriptions and alt texts

## 📄 License

© 2025 Suricato Web. All rights reserved.

---

**Made with ♥ by Suricato Web**

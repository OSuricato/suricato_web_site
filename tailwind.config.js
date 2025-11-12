/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        meerkatPink: '#EC407A',
        graphite: '#111213',
        mist: '#F3F3F3',
        steel: '#BDBDBD',
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        display: ['Space Grotesk', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('flowbite/plugin'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}

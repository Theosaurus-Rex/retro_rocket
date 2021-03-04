module.exports = {
    purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './src/**/*.html',
    './src/**/*.js',
    './src/**/*.jsx',
  ],

  darkMode: false, // or 'media' or 'class'
  theme: {
    
    
    extend: {
      fontFamily: {
        heading: ['Lobster', 'cursive'],
       }
    },
  },
  variants: {
    extend: {},
  },
    plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],

}
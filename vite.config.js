
const path = require('path')
const { defineConfig } = require('vite')

module.exports = defineConfig({
  build: {
    watch: {
      // https://rollupjs.org/guide/en/#watch-options
    },
    lib: {
      name: `mvc-php-skeleton`,
      entry: path.resolve(__dirname, 'main.js'),
      fileName: (format) => `mvc-php-skeleton.${format}.js`
    }
  }
});


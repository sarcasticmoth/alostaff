const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
<<<<<<< HEAD
  publicPath: process.env.NODE_ENV == 'production' ? '/' : '/',
=======
  publicPath: process.env.NODE_ENV == 'production' ? '/' : '/test-form/',
>>>>>>> 7806d43 (add deploy script)
  transpileDependencies: true
})

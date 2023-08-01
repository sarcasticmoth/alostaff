// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: [
    '@nuxt/devtools',
  ],
  devtools: {
    // Enable devtools (default:true)
    enabled: true,
    // VS Code Server options
    vscode: {},
  },
  typescript: {
    shim: false
  }
})

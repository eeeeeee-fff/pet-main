const { defineConfig } = require('@vue/cli-service')

module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: './',
  assetsDir: 'static', // 静态资源目录
  chainWebpack: (config) => {
    // 配置静态资源规则
    config.module
      .rule('glb')
      .test(/\.glb$/)
      .use('file-loader')
      .loader('file-loader')
      .options({
        name: '[name].[hash:8].[ext]',
        outputPath: 'model/' // 输出到 model 目录
      })
      .end() // 添加 end() 方法
  }
  // 如果你需要开启代理，可以取消注释下面的代码
  // devServer: {
  //   proxy: 'http://121.40.90.235:8081'
  // }
})

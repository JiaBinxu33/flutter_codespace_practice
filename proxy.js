// proxy.js (最终版)
const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');
const cors = require('cors'); // 1. 引入 cors 包

const app = express();

// 2. 在代理中间件之前，使用 cors() 中间件
//    这将为所有传入的请求自动添加 'Access-Control-Allow-Origin: *' 响应头
app.use(cors());

app.use('/', createProxyMiddleware({
  target: 'https://www.wanandroid.com',
  changeOrigin: true,
}));

app.listen(8080, () => {
  console.log('CORS-enabled proxy server is running on http://localhost:8080');
});
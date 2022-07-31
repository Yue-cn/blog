cd blog
npm install hexo-cli -g
npm install hexo-render-pug --save
npm install hexo-renderer-sass --save
npm install ejs --save
npm install hexo-render-ejs --save

npm install
hexo generate

cd hexo
npm run build

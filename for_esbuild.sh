set -ex
npm init -y
npm i -D esbuild
npm i open
cat >index.mjs <<EOF
import open from 'open';
open('index.mjs', {wait: false}).then((child)=>{
    console.log('finished');
});
EOF
npx esbuild index.mjs --bundle --minify --sourcemap --platform=node --outfile=main.mjs --format=esm
node main.mjs

set -ex
npm init -y
npm i -D @rspack/cli
npm i open@10.2.0
cat >index.mjs <<EOF
import open from 'open';
open('index.mjs', { wait: false }).then((child) => {
    console.log('finished');
});
EOF
cat >rspack.config.mjs <<EOF
import { defineConfig } from '@rspack/cli';
export default defineConfig({
  target: 'node',
  entry: {
    main: './index.mjs',
  },
  output: {
    filename: 'main.mjs',
    module: true,
  },
  optimization: {
    minimize: true,
  },
  devtool: 'source-map',
  experiments: {
    outputModule: true,
  },
});
EOF
npx rspack build
node dist/main.mjs

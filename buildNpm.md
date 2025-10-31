<!-- build npm -->
### git tag
git tag v1.0.5
git push origin v1.0.5


<!-- publish -->
npm publish
<!--  -->
- run: npm run build --if-present
- run: npm test


### push to git hup
```cmd
bun run deploy
```
<!-- gh-pages -->
bun add gh-pages --dev
"homepage": "https://YOUR_USERNAME.github.io/REPO_NAME",
"scripts": {
  "dev": "bun run vite",
  "build": "vite build",
  "predeploy": "bun run build",
  "deploy": "gh-pages -d dist"
}

# Start use bun

```shell
powershell -c "irm bun.sh/install.ps1 | iex"
```
```shell
bun -v
```
```shell
bun run build   # أو npm run build أو pnpm build
```
```shell
bun dev   # أو npm run dev أو pnpm dev
```

# serve
```shell
serve -s dist
```
## publish in gh-pages
```shell
bun run build
bun run deploy
```
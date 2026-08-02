import { defineConfig } from "vite";
import { resolve } from "node:path";

export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        main: resolve(import.meta.dirname, "index.html"),
        publications: resolve(import.meta.dirname, "publications/index.html"),
      },
    },
  },
});

import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  root: "public",   // <-- tells Vite to use public/ as root
  plugins: [react()],
  build: {
    outDir: "../dist", // output dist folder at project root
  },
  base: "/",        // ensures correct paths
});

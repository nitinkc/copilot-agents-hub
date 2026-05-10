function initializeMermaid() {
  if (typeof mermaid === "undefined") {
    return;
  }

  const scheme = document.body.getAttribute("data-md-color-scheme");
  const theme = scheme === "slate" ? "dark" : "default";

  mermaid.initialize({
    startOnLoad: false,
    theme,
    securityLevel: "loose",
    logLevel: "error",
  });

  mermaid.run({ querySelector: ".mermaid" });
}

if (typeof document$ !== "undefined") {
  document$.subscribe(initializeMermaid);
} else {
  document.addEventListener("DOMContentLoaded", initializeMermaid);
}
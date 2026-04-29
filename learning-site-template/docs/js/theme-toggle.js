// theme-toggle.js
// Persists dark/light mode preference across sessions
// Material theme automatically provides a toggle button

document.addEventListener("DOMContentLoaded", function () {
  // Get stored theme preference from localStorage
  const storedTheme = localStorage.getItem("theme-preference");
  
  // Get current theme from Material theme
  const currentTheme = document.body.getAttribute("data-md-color-scheme");

  // Store theme preference when changed
  const handleThemeChange = (newTheme) => {
    localStorage.setItem("theme-preference", newTheme);
  };

  // Optional: Set initial theme from localStorage if available
  if (storedTheme && storedTheme !== currentTheme) {
    // Material theme handles this automatically via input elements
    // This is here for reference if custom logic is needed
    console.debug(`Theme preference loaded: ${storedTheme}`);
  }

  // Watch for theme changes (Material theme changes via input[type=checkbox])
  const themeToggle = document.querySelector(
    'input[type="checkbox"][title*="color"]'
  );
  
  if (themeToggle) {
    themeToggle.addEventListener("change", function () {
      const newTheme = document.body.getAttribute("data-md-color-scheme");
      handleThemeChange(newTheme);
      console.debug(`Theme preference saved: ${newTheme}`);
    });
  }

  // Also watch via MutationObserver for Material theme changes
  const observer = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {
      if (mutation.attributeName === "data-md-color-scheme") {
        const scheme = document.body.getAttribute("data-md-color-scheme");
        handleThemeChange(scheme);
      }
    });
  });

  observer.observe(document.body, {
    attributes: true,
    attributeFilter: ["data-md-color-scheme"],
  });
});

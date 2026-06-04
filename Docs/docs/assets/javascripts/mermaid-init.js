(function () {
  function getMermaidTheme() {
    return document.body.getAttribute("data-md-color-scheme") === "slate" ? "dark" : "default";
  }

  function renderMermaid() {
    if (typeof mermaid === "undefined") {
      return;
    }

    mermaid.initialize({
      startOnLoad: false,
      theme: getMermaidTheme()
    });

    mermaid.run({
      nodes: document.querySelectorAll(".mermaid")
    });
  }

  if (typeof document$ !== "undefined") {
    document$.subscribe(renderMermaid);
  } else {
    document.addEventListener("DOMContentLoaded", renderMermaid);
  }
})();

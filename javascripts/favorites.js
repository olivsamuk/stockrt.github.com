// Add page to the browser's Favorites
function addToFavorites(title, url) {
    if (document.all)
        window.external.AddFavorite(url, title);
    else if (window.sidebar)
        window.sidebar.addPanel(title, url, "");
}

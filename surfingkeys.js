// an example to create a new mapping `ctrl-y`
api.mapkey('<ctrl-y>', 'Show me the money', function() {
    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map('gt', 'T');

// an example to remove mapkey `Ctrl-i`
api.unmap('<ctrl-i>');

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>

const $$ = function (cssSelector, dom=document) {
    return Array.from(dom.querySelectorAll(cssSelector));
}

const $ = function (cssSelector, dom=document) {
    return dom.querySelector(cssSelector);
}

api.mapkey("[[", 'Move To Previous Page', function() {
    $('.btn_num.active').previousElementSibling?.click();
}, {domain:/bbs\.ruliweb\.com/i});

api.mapkey("]]", 'Move To Next Page', function() {
    $('.btn_num.active').nextElementSibling?.click();
}, {domain:/bbs\.ruliweb\.com/i});

api.mapkey(']]', 'Move To Next Video', function() {
    $('.ytp-next-button')?.click();
}, {domain:/youtube\.com\/watch/i});

api.mapkey('[[', 'Move To Previous Video', function() {
    $('.ytp-prev-button')?.click();
}, {domain:/youtube\.com\/watch/i});

api.mapkey('[[', 'Move To Previous Page', function() {
    $('#pnprev')?.click();
}, {domain:/google\.com\/search/i});

api.mapkey(']]', 'Move To Next Page', function() {
    $('#pnnext')?.click();
}, {domain:/google\.com\/search/i});

api.mapkey('[[', 'Move To Prev Page', function() {
    $('a[class^="Pagination_prevBtn"]')?.click();
}, {domain:/www\.coupang\.com\/np\/search/i});

api.mapkey(']]', 'Move To Next Page', function() {
    $('a[class^="Pagination_nextBtn"]')?.click();
}, {domain:/www\.coupang\.com\/np\/search/i});

api.mapkey('[[', 'Move To Prev Page', function() {
    $('ul.ed.pagination.pagewide>.active>a')
        ?.parentElement
        .previousElementSibling?.querySelector('a')
        .click();
}, {domain:/dogdrip\.net/i});

api.mapkey(']]', 'Move To Next Page', function() {
    $('ul.ed.pagination.pagewide>.active>a')
        ?.parentElement
        .nextElementSibling?.querySelector('a')
        .click();
}, {domain:/dogdrip\.net/i});

api.aceVimMap('ZZ', ':wq', 'normal');
api.aceVimMap('ZQ', ':q!', 'normal');

api.addSearchAlias('al', 'AliExpress', 'https://ko.aliexpress.com/w/wholesale-{0}.html?spm=a2g0o.best.search.0', 's');
api.addSearchAlias('c', 'Coupang', 'https://www.coupang.com/np/search?component=&q={0}&channel=user', 's');
api.addSearchAlias('n', 'Naver', 'https://search.naver.com/search.naver?where=nexearch&query=', 's');

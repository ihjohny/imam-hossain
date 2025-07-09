'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-192.png": "cae9743d1b75df629e28004ae614a637",
"icons/Icon-192.png": "cae9743d1b75df629e28004ae614a637",
"icons/Icon-512.png": "acafb30c55308ca0bcae89d59d22f72a",
"icons/Icon-maskable-512.png": "acafb30c55308ca0bcae89d59d22f72a",
"flutter_bootstrap.js": "7e3e51ce56affbd19af3443afb5f0642",
"assets/AssetManifest.bin.json": "d6c7e0d8765b323124d9c6d41c0d8033",
"assets/AssetManifest.bin": "eefb694c86a5e92f66e68a038fb32d59",
"assets/assets/fonts/FontAwesome.ttf": "de6bf66865cf2734984feeeb9c638a3a",
"assets/assets/fonts/NotoSansDisplay-Regular.ttf": "32132f0c3d249dc1d88a88a3633fc8f0",
"assets/assets/fonts/Custom-Icons.ttf": "bda3d49681f0a31de19e6534db749875",
"assets/assets/fonts/NotoSansDisplay-SemiBold.ttf": "66129a1d2731ae6809f5701018f3cdd7",
"assets/assets/fonts/NotoSansDisplay-Bold.ttf": "787219e31500345de780ebbf60ff8537",
"assets/assets/translations/en.json": "7f57126bdfcc00f733217aa4860e9d6a",
"assets/assets/images/research_logo.jpg": "9ae5d7e347206ad08f480dc04191cdf5",
"assets/assets/images/article_logo.jpg": "815ce9730931fa427bab4ae4d1daabe4",
"assets/assets/images/project-myp.jpg": "b5a5b039f628da25f3603639c3aba6bb",
"assets/assets/images/android_logo.jpg": "fca7b2517d0b2e4ea0cd451533067183",
"assets/assets/images/splash-rocket.apng": "b6bd282002896f2decac896dcf74a1e2",
"assets/assets/images/certification_logo.jpg": "c5c0f6a7076caf2124a01470ebc12b3d",
"assets/assets/images/project-hungrynaki.jpg": "53a8416cea69a8d1e3937acf572caf09",
"assets/assets/images/flutter_logo.jpg": "11730d08fa60e5d497c6827f65288e85",
"assets/assets/images/link_icon.jpg": "c5aa73ad815bcbcc8891606831f4ea44",
"assets/assets/images/profile-pic.jpg": "7547ee1090359472f7ee5f37e6720818",
"assets/assets/images/brain_station_23_cover.jpg": "3c610ed10e6d85a5e72572802317b145",
"assets/assets/images/medium_logo.jpg": "2d50de9bf420dd5f2d1e653f614b0804",
"assets/assets/images/link_read.jpg": "81c542fcba3b34463938022fb6d10885",
"assets/assets/images/education_logo.jpg": "e3b7556d903f8d178ca92bff6f170b27",
"assets/assets/images/project-longshot.jpg": "a68f2b8207db676a557268ecd31e0dfe",
"assets/assets/images/app-icon.png": "ab3cdd95123bf6724a57d56165c4f7a6",
"assets/assets/images/play_store_logo.jpg": "65a4a8e516390c6a9a3d2825bc4fd284",
"assets/assets/images/project-myb.jpg": "ddc5b58fc41d306c5b567a9fb921246e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/FontManifest.json": "f63f72b2a663f46888eb23646224dc62",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/NOTICES": "6ceab33eaa30f3005da1bdd9b6570fdf",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "5764321c7116947d85672c50c8414718",
"main.dart.js": "b5cd3c08e6c95ffb1d4d337dad91163c",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"splash/img/dark-3x.png": "63e72dbed34bd29998871f52c6516098",
"splash/img/light-1x.png": "fde8b6e662038406f4e8ae7c84e48af7",
"splash/img/light-4x.png": "99525d5e8d6e6c563337c9ce2118e373",
"splash/img/light-2x.png": "0d655d763cc4ba19489d2fc9a4592f78",
"splash/img/light-3x.png": "63e72dbed34bd29998871f52c6516098",
"splash/img/dark-4x.png": "99525d5e8d6e6c563337c9ce2118e373",
"splash/img/dark-1x.png": "fde8b6e662038406f4e8ae7c84e48af7",
"splash/img/dark-2x.png": "0d655d763cc4ba19489d2fc9a4592f78",
"favicon.png": "62c3a1e874913437d0decad8a666c4f4",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"manifest.json": "e3bfad24544ae293943730dffd30f976",
"index.html": "30f7a78d64a867c33a9b1724d7d561ca",
"/": "30f7a78d64a867c33a9b1724d7d561ca",
"version.json": "3e6d8edb8435f852e0c10876a8b4befd"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

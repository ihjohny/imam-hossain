'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-192.png": "cae9743d1b75df629e28004ae614a637",
"icons/Icon-192.png": "cae9743d1b75df629e28004ae614a637",
"icons/Icon-512.png": "acafb30c55308ca0bcae89d59d22f72a",
"icons/Icon-maskable-512.png": "acafb30c55308ca0bcae89d59d22f72a",
"flutter_bootstrap.js": "205b8c2f17ecdacc338448c16d590d2f",
"assets/AssetManifest.bin.json": "274d27420d0a6cccb40b48b3bb581ed4",
"assets/AssetManifest.bin": "fb47a3634c35ab85d045fb1128ec9745",
"assets/assets/fonts/FontAwesome.ttf": "de6bf66865cf2734984feeeb9c638a3a",
"assets/assets/fonts/Custom-Icons.ttf": "bda3d49681f0a31de19e6534db749875",
"assets/assets/translations/en.json": "bfa38f782029cdd5a85e0d7b7f833289",
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
"assets/FontManifest.json": "b8476e744d137ea3cff2f72381e5af06",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/NOTICES": "b2523a971542a7a2b5b21ccae6e5ac32",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "847e297d7020d9eaee19403b4648aeda",
"main.dart.js": "4fbc9fc0871e95414e56ac7c0e5363c7",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"main.dart.wasm": "6f152301ec5ce1f45173a7e071780c24",
"favicon.png": "62c3a1e874913437d0decad8a666c4f4",
"main.dart.mjs": "9a63edeac57669790c7fa99abcf2862b",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"manifest.json": "f64ac5f2eb16405205216945ca49ff24",
"index.html": "da8348fad1a5c8122f61545711ab23c2",
"/": "da8348fad1a5c8122f61545711ab23c2",
"version.json": "3e6d8edb8435f852e0c10876a8b4befd"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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

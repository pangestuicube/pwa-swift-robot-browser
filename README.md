# 🔧 Robot Framework Test Setup (Browser Library)

Dokumentasi ini menjelaskan cara menjalankan automation test menggunakan **Robot Framework** dengan **Browser Library** (berbasis Playwright), serta cara konfigurasi browser, mode headless, dan viewport melalui variabel CLI.

---

## 📁 Struktur Folder 

<img width="656" height="276" alt="image" src="https://github.com/user-attachments/assets/3b44aa6e-be5d-4d1a-bab6-146a870fd735" />

---

## ⚙️ Default Konfigurasi

```robot
${BROWSER}      chromium
${HEADLESS}     False
```

Kamu dapat mengubah nilai tersebut saat runtime menggunakan flag `--variable`.

---

## 🚀 Cara Menjalankan Test per Browser

### ✅ 1. Chromium (default)

```bash
robot --variable BROWSER:chromium --variable HEADLESS:False tests/
```

### ✅ 2. Firefox

```bash
robot --variable BROWSER:firefox --variable HEADLESS:False tests/
```

### ✅ 3. WebKit (Safari engine)

```bash
robot --variable BROWSER:webkit --variable HEADLESS:False tests/
```

---

## 🧪 Contoh Test Case Setup

```robot
*** Keywords ***
Start Test Setup
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context
    New Page       ${BASE_URL}
    Browser.Set Viewport Size    width=1920    height=1080
```

---

## 🛠 Setup dependencies

Sebelum menjalankan test, pastikan Playwright dan browser dependencies sudah terinstal dengan menjalankan:

```bash
pip install -r requirements.txt
```

---

## 💡 Tips Tambahan

- Jalankan dalam mode **headless** untuk CI/CD:

  ```bash
  robot --variable HEADLESS:True tests/
  ```

- Tambahkan `--output` untuk mengatur nama file hasil test:
  ```bash
  robot --output results/output.xml tests/
  ```

---

## 📄 Referensi

- [Robot Framework Browser Library Docs](https://robotframework-browser.org/)
- [Playwright Browser Support](https://playwright.dev/docs/browsers)

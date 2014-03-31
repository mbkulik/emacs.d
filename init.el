
;; disable menu bar
(menu-bar-mode -1)

;; stop splash screen from showing
(setq inhibit-splash-screen t)

;; disable version control
(setq vc-handled-backends ())

;; better auto indentation
(electric-indent-mode)

;; set light background, better colors with iTerm2
(setq frame-background-mode 'dark)

;; set backup and autosave to temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; packages
(add-to-list 'load-path "~/.emacs.d/lisp/")

(autoload 'writeroom-mode "writeroom-mode" "Writeroom Mode." t)

(autoload 'web-mode "web-mode" "Web Mode." t)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

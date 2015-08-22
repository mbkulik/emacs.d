;;
;; Michael B. Kulik
;; custom emacs file
;;

;; start as a server
(server-start)

;; disable menu bar
(menu-bar-mode -1)

;; stop splash screen from showing
(setq inhibit-splash-screen t)

;; disable version control
(setq vc-handled-backends ())

;; better auto indentation
(electric-indent-mode)

;;ido mode
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-match t)


;; GUI Only Stuff
(if window-system (load-theme 'tango-dark))
(if window-system (tool-bar-mode -1))

;; Text Only Stuff
(if (not window-system) (setq frame-background-mode 'dark))
(if (not window-system) (set-face-foreground 'minibuffer-prompt "white"))

;; set backup and autosave to temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)

;; key bindings
(global-set-key (kbd "<C-backspace>") 'kill-this-buffer)
(global-set-key (kbd "<f3>") 'compile)
(setq compilation-read-command nil)

(add-hook 'doc-view-mode-hook 'auto-revert-mode)`

;; whitespace highlighting
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'latex-mode-hook 'whitespace-mode)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

;;;org-mode
(use-package org
             :ensure t)

;;;writeroom-mode
(use-package writeroom-mode
             :ensure t)

(autoload 'writeroom-mode "writeroom-mode" "Writeroom Mode." t)
(autoload 'org-mode "org-mode" "Org Mode." t)

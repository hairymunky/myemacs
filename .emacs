(setq user-full-name "Real Name Here"
      user-mail-address "Real Email Address Here")

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;; visual appearance
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)
(setq inhibit-startup-screen t)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; font
(set-frame-font "Hack 12" nil t)

(use-package doom-themes
	     :ensure t
	     :config
	     (load-theme 'doom-one t)
	     (doom-themes-visual-bell-config))

(use-package smart-mode-line-powerline-theme
	     :ensure t)
(use-package smart-mode-line
	     :ensure t
	     :config
	     (setq sml/theme 'powerline)
	     (add-hook 'after-init-hook 'sml/setup))


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(use-package diminish
	     :ensure t)

;; syntac checking etc
(use-package company
	     :ensure t
	     :diminish company-mode
	     :config
	     (add-hook 'after-init-hook #'global-company-mode))

(use-package flycheck
	     :ensure t
	     :diminish flycheck-mode
	     :config
	     (add-hook 'after-init-hook #'global-flycheck-mode))

;; git
(use-package magit
	     :bind (("C-M-g" . magit-status)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default))
 '(package-selected-packages
   '(flycheck company diminish smart-mode-line-powerline-theme doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

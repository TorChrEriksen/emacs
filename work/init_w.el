;; Remove that welcome screen
(setq inhibit-startup-message t)

;; Remove the menubar and toolbar for GUI emacs
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Load MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
	     ;;'("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; Custom load paths
(add-to-list 'custom-theme-load-path "~/.emacs.d/packages/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/packages/themes/emacs-color-theme-solarized/")

;; Load jazz theme
;; (load-theme 'jazz t)
;; (set-frame-font
;;  "-unknown-Liberation Mono-normal-normal-normal-*-11-*-*-*-m-0-iso10646-1")
; (set-face-attribute 'default nil :height 85)

;; org stuff
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; set org todo files
(setq org-agenda-files (list "~/org/first.org"
			     "~/org/tasks.org"
			     "~/org/other.org"
			     "~/org/emacs_tips.org"))

;; Load solarized theme
(load-theme 'solarized t)

;; Keybinds for scrolling window, without moving cursor
(global-set-key "\M-p" "\C-u1\M-v")
(global-set-key "\M-n" "\C-u1\C-v")

;; Display line numbers, this can create input lag
;; (global-linum-mode t)
;; (setq linum-format "%5d \u2502 ")

;; Cut, copy and paste stuff
;; (setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)
(delete-selection-mode 1)

;; (global-set-key "\C-w" 'clipboard-kill-region)
;; (global-set-key "\M-w" 'clipboard-kill-ring-save)
;; (global-set-key "\C-y" 'clipboard-yank)

;; Set windmove
(add-hook 'emacs-startup-hook 'windmove-default-keybindings)

;; Make buffers read only as default
(defun set-buffer-read-only () (setq buffer-read-only t))
(add-hook 'emacs-startup-hook 'set-buffer-read-only)

;; Display column number
(setq column-number-mode t)

; disable auto-fill (@->_<-@)
(setq auto-fill-mode nil)

;; Fill-Column-Indicator
;; breaks company and autocomplete
;; http://emacs.stackexchange.com/questions/147/how-can-i-get-a-ruler-at-column-80
(require 'fill-column-indicator)

;; Remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; xml mode handling
(defun tc-indent-tabs-hook ()
  ; tab handling
  (setq tab-width 4
	indent-tabs-mode nil)
)

; xml hook
(add-hook 'nxml-mode-hook 'tc-indent-tabs-hook)

; ruby hook
(add-hook 'ruby-mode-hook 'tc-indent-tabs-hook)

; text mode hook
; (add-hook 'text-mode-hook (lambda () (auto-fill-mode -1)))
; (add-hook 'text-mode-hook 'auto-fill-mode -1)
; (turn-off-auto-fill)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

(add-hook 'text-mode-hook 'tc-indent-tabs-hook)

;; Set auto-save and backup directory
(setq backup-directory-alist
      `((".*" . ,"/tmp/emacs-temp/")))
(setq auto-save-file-name-transforms
      `((".*" ,"/tmp/emacs-temp/" t)))

;; Add a check when exiting
(setq confirm-kill-emacs 'y-or-n-p)

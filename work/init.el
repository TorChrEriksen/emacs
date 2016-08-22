;; Remove that welcome screen
(setq inhibit-startup-message t)

;; Load MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
	     ;;'("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; Display line numbers
(global-linum-mode t)
(setq linum-format "%5d \u2502 ")

;; Cut, copy and paste stuff
;; (setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)
(setq delete-selection-mode t)

;; (global-set-key "\C-w" 'clipboard-kill-region)
;; (global-set-key "\M-w" 'clipboard-kill-ring-save)
;; (global-set-key "\C-y" 'clipboard-yank)

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
  (setq-default c-basic-offset 2)

  ; tab handling
  (setq tab-width 4
	indent-tabs-mode nil)
)

; js mode handling
(defun tc-indent-tabs-hook-js ()
  (setq-default c-basic-offset 2)

  (setq js-indent-level 2)

  ; tab handling
  (setq tab-width 4
	indent-tabs-mode nil)
)

; xml hook
(add-hook 'nxml-mode-hook 'tc-indent-tabs-hook)

; ruby hook
(add-hook 'ruby-mode-hook 'tc-indent-tabs-hook)

; javascript hook
(add-hook 'js-mode-hook 'tc-indent-tabs-hook-js)
(add-hook 'javascript-mode-hook 'tc-indent-tabs-hook-js)

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

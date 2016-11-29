;; set load-path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; uncomment if you have Tamsyn installed
(custom-set-faces
 '(default ((t (:family "Misc Tamsyn" :foundry "Misc" :slant normal :weight normal :height 100 :width normal)))))

;; Load MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             ;; '("melpa" . "https://melpa.org/packages/"))
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'solarized)
(deftheme solarized-dark "The dark variant of the Solarized colour theme")
(create-solarized-theme 'dark 'solarized-dark)
(provide-theme 'solarized-dark)

(deftheme solarized-light "The light variant of the Solarized colour theme")
(create-solarized-theme 'light 'solarized-light)
(provide-theme 'solarized-light)

;; no startup message, no menu bar, no toolbar, empty scratch buffer
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq initial-scratch-message "")

;; Display line numbers
(global-linum-mode t)

;; Attempt to fix the scroll/type lag
(with-eval-after-load "linum"
  ;; set `linum-delay' so that linum uses `linum-schedule' to update linums.
  (setq linum-delay t)

  ;; create a new var to keep track of the current update timer.
  (defvar-local my-linum-current-timer nil)

  ;; rewrite linum-schedule so it waits for 1 second of idle time
  ;; before updating, and so it only keeps one active idle timer going
  (defun linum-schedule ()
    (when (timerp my-linum-current-timer)
      (cancel-timer my-linum-current-timer))
    (setq my-linum-current-timer
          (run-with-idle-timer 1 nil #'linum-update-current))))

;; column numbers
(setq column-number-mode t)

;; use whitespace instead of tabs
(setq-default indent-tabs-mode nil)

; disable auto-fill (@->_<-@)
(setq auto-fill-mode nil)

; Fill column indicator (fci-mode)
(setq-default fill-column 80)

;; Ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; set window navigation
(windmove-default-keybindings)

;; Make buffers read only as default
(defun set-buffer-read-only () (setq buffer-read-only t))
(add-hook 'emacs-startup-hook 'set-buffer-read-only)

;; Keybinds for scrolling window, without moving cursor
(global-set-key "\M-p" "\C-u1\M-v")
(global-set-key "\M-n" "\C-u1\C-v")

;; Cut, copy and paste stuff
;; (setq x-select-enable-primary t)
;; (global-set-key (kbd "<mouse-2>") 'x-clipboard-yank)
(setq x-select-enable-clipboard t)
(delete-selection-mode 1)

;; remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; confirm quit emacs
(setq confirm-kill-emacs 'y-or-n-p)

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

;; custom c-mode-hook
(defun tc-c-mode-hook ()
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'block-close 0)
  (c-set-offset 'arglist-intro 4)
  (c-set-offset 'case-label 2)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'brace-list-open 0)
  (c-set-offset 'brace-list-close 0))

; xml hook
(add-hook 'nxml-mode-hook 'tc-indent-tabs-hook)

; ruby hook
; (add-hook 'ruby-mode-hook 'tc-indent-tabs-hook)

; javascript hook
(add-hook 'js-mode-hook 'tc-indent-tabs-hook-js)
(add-hook 'javascript-mode-hook 'tc-indent-tabs-hook-js)

; c hook
(add-hook 'c-mode-common-hook 'tc-c-mode-hook)
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; qml mode
(require 'qml-mode)
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))

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

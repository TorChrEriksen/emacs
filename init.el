;; set load-path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; solarized theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/emacs-color-theme-solarized/")
;; (load-theme 'solarized t)

;; Load MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             ;; '("melpa" . "https://melpa.org/packages/"))
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; no startup message, no menu bar, no toolbar, empty scratch buffer
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(setq initial-scratch-message "")

;; Display line numbers
(global-linum-mode t)
(setq linum-format "%5d \u2502 ")

;; column numbers
(setq column-number-mode t)

;; use whitespace instead of tabs
(setq-default indent-tabs-mode nil)

; disable auto-fill (@->_<-@)
(setq auto-fill-mode nil)

; Fill column indicator (fci-mode)
(setq-default fill-column 80)

;; Make buffers read only as default
(defun set-buffer-read-only () (setq buffer-read-only t))
(add-hook 'emacs-startup-hook 'set-buffer-read-only)

;; Keybinds for scrolling window, without moving cursor
(global-set-key "\M-p" "\C-u1\M-v")
(global-set-key "\M-n" "\C-u1\C-v")

;; Cut, copy and paste stuff
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes (quote ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "afbb40954f67924d3153f27b6d3399df221b2050f2a72eb2cfa8d29ca783c5a8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(delete-selection-mode nil)
 '(fci-rule-color "#383838")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors (--map (solarized-color-blend it "#fdf6e3" 0.25) (quote ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(hl-bg-colors (quote ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors (quote ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors (quote ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list (quote (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Misc Tamsyn" :foundry "Misc" :slant normal :weight normal :height 100 :width normal)))))

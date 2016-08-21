;; Copy line, use C-y to paste it later
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w")

;; Shortcuts for navigating windows based on geometry
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(add-hook 'prog-mode-hook 'linum-mode)
(tool-bar-mode -1)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(setq-default tab-width 3)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'python)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (jazz)))
 '(custom-safe-themes
	(quote
	 ("66c39acbff18daeeff5177ceeff2eb8b4d7cd0e2fc5fcb68cf39a6dafdc7a453" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

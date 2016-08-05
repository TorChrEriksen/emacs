;; no startup message
(setq inhibit-startup-message t)

;; no menu bar
(menu-bar-mode -1)

;; no toolbar
(tool-bar-mode -1)

;; set scratch buffer
(setq initial-scratch-message "")

;; column numbers
(setq column-number-mode t)

;; use whitespace instead of tabs
(setq-default indent-tabs-mode nil)

;; set window navigation
(windmove-default-keybindings)

;; move auto save and backup dirs
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; confirm quit emacs
(setq confirm-kill-emacs 'yes-or-no-p)

;; custom c-mode-hook
(defun tc-c-mode-hook ()
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'block-close 0)
  (c-set-offset 'arglist-intro 4)
  (c-set-offset 'case-label 2)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'brace-list-open 0)
  (c-set-offset 'brace-list-close 0))
(add-hook 'c-mode-common-hook 'tc-c-mode-hook)

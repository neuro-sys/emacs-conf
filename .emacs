(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless package--initialized (package-initialize t))
(eval-when-compile (add-to-list 'load-path "~/use-package") (require 'use-package))

(use-package flycheck :ensure t :init (global-flycheck-mode))
(use-package typescript-mode :ensure t)
(use-package queue :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package smex :ensure t)
(use-package underwater-theme :ensure t)
(use-package projectile :ensure t)
(use-package auto-complete :ensure t)
(use-package magit :ensure t)
(use-package multiple-cursors :ensure t)
(use-package tide :ensure t)

(setq-default visible-bell 0)
(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 2)
(setq-default tab-width 4)
(setq-default js-indent-level 2)
(setq-default typescript-indent-level 2)
(setq-default backup-directory-alist '(("." . "~/.emacs-file-backups")))
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(setq-default custom-file (concat user-emacs-directory "custom"))
(setq-default flycheck-idle-change-delay 1.0)
(setq-default erc-hide-list (list "JOIN" "PART" "QUIT"))
(setq-default gnutls-algorithm-priority "normal:-dhe-rsa")
(setq-default flycheck-emacs-lisp-load-path 'inherit)
(setq-default inhibit-startup-screen t)

(require 'ido-vertical-mode)
(require 'projectile)
(require 'auto-complete)

(set-face-attribute 'default nil :family "pxplus ibm vga8" :height 100)
(load-theme 'wombat t)
(global-display-line-numbers-mode)
(column-number-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(ido-mode)
(ido-vertical-mode)
(projectile-mode +1)
(global-auto-complete-mode t)
(global-auto-revert-mode 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(global-set-key (kbd "C-c f") 'projectile-find-file-in-directory)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x g") 'magit-status)

(add-to-list 'ac-modes 'typescript-mode)
(add-to-list 'grep-find-ignored-directories "node_modules")
(add-to-list 'grep-find-ignored-directories "coverage")

(load "~/emacs-conf/ediff-disable-themes.el")
(load "~/emacs-conf/flycheck-typescript-eslint.el")
(load "~/emacs-conf/save-buffers-kill-terminal-prompt.el")

(add-hook 'typescript-mode-hook 'tide-mode)

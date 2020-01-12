(require 'package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (add-to-list 'load-path "~/use-package")
  (require 'use-package))

(use-package flycheck :ensure t :init (global-flycheck-mode))
(use-package typescript-mode :ensure t)
(use-package queue :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package smex :ensure t)
(use-package underwater-theme :ensure t)
  
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
(setq-default gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq-default flycheck-emacs-lisp-load-path 'inherit)
(setq-default inhibit-startup-screen t)

(set-face-attribute 'default nil :family "pxplus ibm vga8" :height 160)
(load-theme 'underwater t)
(global-display-line-numbers-mode)
(column-number-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(ido-mode)
(ido-vertical-mode)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(load "~/.emacs.d/ediff-disable-themes.el")
(load "~/.emacs.d/flycheck-typescript-eslint.el")

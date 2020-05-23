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
(use-package markdown-mode :ensure t)
(use-package green-phosphor-theme :ensure t)
(use-package which-key :ensure t)

(setq-default visible-bell 0)
(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 2)
(setq-default tab-width 4)
(setq-default js-indent-level 2)
(setq-default typescript-indent-level 2)
(setq-default backup-directory-alist '(("." . "~/.emacs-file-backups")))
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(setq-default custom-file "~/.emacs-custom.el")
(setq-default flycheck-idle-change-delay 1.0)
(setq-default erc-hide-list (list "JOIN" "PART" "QUIT"))
(setq-default gnutls-algorithm-priority "normal:-dhe-rsa")
(setq-default flycheck-emacs-lisp-load-path 'inherit)
(setq-default inhibit-startup-screen t)
;; (setq-default inhibit-compacting-font-caches t)
(setq-default global-visual-line-mode nil)

(require 'ido-vertical-mode)
(require 'projectile)
(require 'auto-complete)
(require 'which-key)

(set-face-attribute 'default nil :family "pxplus ibm vga8" :height (if (eq system-type 'windows-nt)
                                                                       140
                                                                     100))
(load-theme 'green-phosphor t +1)
(global-display-line-numbers-mode +1)
(column-number-mode +1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(ido-mode +1)
(ido-vertical-mode)
(projectile-mode +1)
(global-auto-complete-mode t)
(global-auto-revert-mode 1)
(scroll-bar-mode -1)
(toggle-truncate-lines -1)
(which-key-mode +1)

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
(add-to-list 'grep-find-ignored-directories "build")

;; (load "~/emacs-conf/flycheck-typescript-eslint.el")
;; (load "~/emacs-conf/save-buffers-kill-terminal-prompt.el")

;; (add-hook 'typescript-mode-hook 'tide-mode)
(put 'upcase-region 'disabled nil)

;; M-x erc-start to connect
;; M-p to prompt ZNC password
;; Once the server buffer is killed, kills all erc-mode buffers

(require 'erc)

(defconst *erc-my-user-name* "neuro_sys")
(defconst *erc-my-server-name* "neuro.gereksiz.org")
(defconst *erc-my-server-port* 8888)
(defconst *erc-my-server-buffer-name* (concat *erc-my-server-name* ":" (number-to-string *erc-my-server-port*)))

(defun erc-start ()
  (interactive)
    (erc-tls :server *erc-my-server-name* :port *erc-my-server-port*
             :nick *erc-my-user-name* :full-name *erc-my-user-name*))

(defun erc-pass ()
  (interactive)
  (with-current-buffer (get-buffer *erc-my-server-buffer-name*)
    (let ((pass (read-passwd "Password:")))
      (erc-send-input (concat "/quote PASS " *erc-my-user-name* ":" pass)))))

(add-hook 'erc-mode-hook
          (lambda () (local-set-key (kbd "M-p") #'erc-pass)))

(require 'desktop)

(when (display-graphic-p)
  (desktop-save-mode 1)
  ())

(add-to-list 'desktop-globals-to-save 'register-alist)

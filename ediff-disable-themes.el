(defvar ediff-theme-temporary)

(defun ediff-theme-mode-hook ()
  (dolist (theme custom-enabled-themes)
    (push theme ediff-theme-temporary)
    (disable-theme theme)))

(defun ediff-theme-kill-buffer-hook ()
  (dolist (theme ediff-theme-temporary)
    (enable-theme theme)
    (pop ediff-theme-temporary)))

(add-hook 'ediff-mode-hook #'ediff-theme-mode-hook)
(add-hook 'ediff-quit-hook #'ediff-theme-kill-buffer-hook)

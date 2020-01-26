(add-hook 'typescript-mode-hook 'flycheck-mode)

(with-eval-after-load 'flycheck
  ;; Use javascript-eslint checker in typescript-mode
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  ;; Override the buggy function
  (defun flycheck-eslint-config-exists-p ()
    "Whether there is a valid eslint config for the current buffer."
    (let* ((executable (flycheck-find-checker-executable 'javascript-eslint))
           (exitcode (and executable (call-process executable nil nil nil
                                                   "--print-config" (buffer-file-name)))))
      (eq exitcode 0))))
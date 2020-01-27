(defun save-buffers-kill-terminal-prompt ()
  (interactive)
  (if (y-or-n-p "Quit?")
      (save-buffers-kill-terminal)))

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal-prompt)

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

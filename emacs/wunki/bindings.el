;; shortcuts
(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "<f9>") 'mu4e)
(global-set-key (kbd "<f10>") 'erc-start-or-switch)
(global-set-key (kbd "<f11>") 'jabber-start)

;; training wheels
(global-unset-key (kbd "C-x o"))

;; search forward regexp
(global-set-key (kbd "C-c C-s") 'search-forward-regexp)

;; move around changes
(global-set-key (kbd "C-c C-n") 'goto-last-change)

;; quickly twitter something
(global-set-key (kbd "C-c t") 'twittering-update-status-interactive)

;; expand region (increases selected region by semantic units)
(global-set-key (kbd "C-c e") 'er/expand-region)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

;; edit file with sudo
(global-set-key (kbd "C-c C-f") 'sudo-edit)

;; join line command
(global-set-key (kbd "C-c j") 'join-line)

;; who needs shift when using forward/backwards paragraph
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)

;; find recent files quickly
(global-set-key (kbd "C-c C-r") 'recentf-ido-find-file)

;; rotate slime buffers
(global-set-key (kbd "C-c C-x n") 'slime-cycle-connections)

;; map execute command to the C-key
;; less hand movement with this command
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; kill word and avoid using the backspace
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)

;; deleting and renaming of the active buffer
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; open a new line below or above
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;; ace-jump and idomenu for moving around
(define-key global-map (kbd "C-&") 'ace-jump-mode)
(define-key global-map (kbd "C-*") 'idomenu)

;; toggle between light and dark theme
(define-key global-map (kbd "C-c C-t") 'toggle-dark-light-theme)

;; newline and indent on some modes
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'rust-mode 'set-newline-and-indent)

;; github gists
(define-key global-map (kbd "C-S-c g") 'gist-buffer-private)
(define-key global-map (kbd "C-S-c b") 'gist-buffer)
(define-key global-map (kbd "C-S-c r") 'gist-region)

;; quickly edit emacs config with ido
(define-key global-map (kbd "C-c C-e C-e") 
  '(lambda () 
     (interactive)
     (ido-find-file-in-dir "~/.emacs.d/wunki")))

;; move buffers around
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; move between windows
(global-set-key (kbd "C-c L") 'windmove-right)
(global-set-key (kbd "C-c H") 'windmove-left)
(global-set-key (kbd "C-c P") 'windmove-up)
(global-set-key (kbd "C-c N") 'windmove-down)

;; move current window into focus
(global-set-key (kbd "C-M-<return>") (lambda ()
                                       (interactive)
                                       (buf-move-left)
                                       (buf-move-up)))

;; resize windows
(global-set-key (kbd "C-M-h") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>") 'enlarge-window)
(global-set-key (kbd "C-M-<up>") 'shrink-window)

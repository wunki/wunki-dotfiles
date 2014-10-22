;; mac only settings.
(set-frame-font "Fira Mono-14")
(add-to-list 'default-frame-alist '(font . "Fira Mono 14"))

;; browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; correct path
(exec-path-from-shell-initialize)

;; copy some vars over
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "PYTHONPATH")

;; emacsclient as editor for Magit
(setenv "EDITOR" "emacsclient")

;; Set the Apple key as Meta
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
(setq default-input-method "MacOSX")
(global-set-key (kbd "M-`") 'ns-next-frame)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)
(global-set-key (kbd "M-H") 'ns-do-hide-others)

(provide 'wunki-mac)

;; hide all the things
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; load theme and don't ask if it's save.
(if (display-graphic-p)
    (load-theme 'dracula t)
  (load-theme 'dracula t))

;; font
(let ((font "Iosevka")
      (size (if (mac?) 14 10)))
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%s" font size)))
  (set-frame-font (format "%s-%s" font size) nil t))

;; increase space between lines on the mac.
(if (mac?)
    (setq line-spacing 2))

(provide 'wunki-theme)

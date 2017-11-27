;; hide all the things
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; load theme and don't ask if it's save.
(if (display-graphic-p)
    (load-theme 'funki t)
  (load-theme 'sanityinc-tomorrow-blue t))

;; font
(let ((font "Operator Mono")
      (size (if (mac?) 15 9))
      (weight (if (mac?) "Light" "Regular")))
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%s" font size)))
  (set-frame-font (format "%s-%s:weight=%s" font size weight) nil t))

;; unboldify all the things
;; (mapc
;;    (lambda (face)
;;      (when (eq (face-attribute face :weight) 'bold)
;;        (set-face-attribute face nil :weight 'normal)))
;;    (face-list))

;(set-face-bold 'bold nil)

(provide 'wunki-theme)

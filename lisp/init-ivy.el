;; init-ivy.el — ivy + counsel + swiper

(use-package ivy
  :ensure t
  :hook (after-init . ivy-mode)
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) "))

(use-package counsel
  :ensure t
  :after ivy
  :hook (ivy-mode . counsel-mode))

(use-package swiper
  :ensure t
  :after ivy
  :bind ("C-s" . swiper))

(provide 'init-ivy)

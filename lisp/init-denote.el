;; init-denote.el — Denote 笔记系统

(use-package denote
  :ensure t
  :defer t
  :custom
  (denote-directory "~/org/denote")
  (denote-file-type 'org)
  :bind (("C-c n n" . denote)
         ("C-c n f" . denote-open-or-create)
         ("C-c n i" . denote-link)
         ("C-c n b" . denote-backlinks)))

(provide 'init-denote)

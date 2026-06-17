;; init-company.el — 补全框架

(use-package company
  :ensure t
  :hook ((org-mode        . company-mode)
         (emacs-lisp-mode . company-mode))
  :custom
  (company-idle-delay            0.3)
  (company-minimum-prefix-length 2)
  (company-tooltip-limit         10)
  (company-show-numbers          t)
  (company-dabbrev-downcase      nil)
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("<tab>" . company-complete-selection)
         ("RET" . nil)))

;; ── 美化补全框 ───────────────────────────────────────────
(use-package company-box
  :ensure t
  :after company
  :hook (company-mode . company-box-mode)
  :custom
  (company-box-show-single-candidate t)
  (company-box-max-candidates        10)
  (company-box-icons-alist 'company-box-icons-nerd-icons))

(provide 'init-company)

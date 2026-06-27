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

(provide 'init-company)

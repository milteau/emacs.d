;; init-dashboard.el — 启动页

(use-package projectile
  :ensure t
  :defer t
  :bind-keymap ("C-c p" . projectile-command-map))

(use-package dashboard
  :ensure t
  :demand t                         ;; 强制立即加载，不能延迟
  :config
  (setq dashboard-banner-logo-title  "𝓔𝓶𝓪𝓬𝓼  ── 鹏程电子书房")
  (setq dashboard-startup-banner     "~/.emacs.d/avatar.jpg")
  (setq dashboard-banner-length 150)
  (setq dashboard-banner-max-width 150)
  (setq dashboard-center-content     t)
  (setq dashboard-show-shortcuts     nil)
  (setq dashboard-items
        '((recents   . 5)
          (bookmarks . 6)
          (projects  . 5)))         ;; 去掉 agenda，避免启动时强制加载 org
  (setq dashboard-item-names
        '(("Recent Files:"  . "近期文件")
          ("Bookmarks:"     . "书签")
          ("Projects:"      . "项目")))
  (setq dashboard-display-icons-p    t)
  (setq dashboard-icon-type          'nerd-icons)
  (setq dashboard-set-file-icons     t)
  (setq dashboard-set-heading-icons  t)
  (setq dashboard-footer-messages
        '("知之为知之，不知为不知，是知也。"
	  "吾生也有涯，而知也无涯。"))
  (setq dashboard-footer-icon "📖")
  (setq initial-buffer-choice
        (lambda () (get-buffer-create "*dashboard*")))
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)

;; init.el — 主入口，只做加载调度

;; ── 性能优化：启动时增加 GC 阈值 ─────────────────────
(setq gc-cons-threshold (* 100 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 8 1024 1024))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ── 基础层 ──────────────────────────────────────────────
(require 'init-core)     ;; 编辑器基本行为
(require 'init-encoding) ;; 编码 / 字体
(require 'init-packages) ;; 包管理器初始化
(require 'init-backup)

;; ── UI 层 ───────────────────────────────────────────────
(require 'init-ui)       ;; 主题 / modeline
(require 'init-dashboard) ;; 优先加载主面板，提升视觉启动速度
(require 'init-modeline)
(my-modeline-mode 1)

;; ── 核心工具层（启动时立即可用） ─────────────────────────
;; 💡 建议在 ivy 和 vertico 之间二选一，如果全要，按下方保留：
(require 'init-ivy)      
(require 'init-vertico)  
(require 'init-company)  ;; 补全系统
(require 'init-publish)
(require 'init-org)

;; ── Treemacs 真正按键触发层 ──────────────────────────────
;; 绑定到你原本习惯的全局快捷键上
(global-set-key (kbd "C-x t t") 'my-treemacs-toggle)
(global-set-key (kbd "C-x t 1") 'my-treemacs-select)

;; ── 延迟工具层（开机空闲 1 秒后在后台静默加载） ───────────
(run-with-idle-timer 1.0 nil
  (lambda ()
    (require 'init-denote)   ;; 笔记系统
    (require 'init-git)      ;; git管理
    (message "后台扩展模块加载完成 ✨")))

;; —— 个人信息 ──
(setq user-full-name "鹏程Frank"
      user-mail-address "fupengcheng95@outlook.com")

;; ── Custom（由 Emacs 自动维护，请勿手动编辑）───────────
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

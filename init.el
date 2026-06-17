;; init.el — 主入口，只做加载调度
;; 模块存放于 ~/.emacs.d/lisp/

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ── 基础层 ──────────────────────────────────────────────
(require 'init-core)     ;; 编辑器基本行为
(require 'init-encoding) ;; 编码 / 字体
(require 'init-packages) ;; 包管理器初始化

;; ── UI 层 ───────────────────────────────────────────────
(require 'init-ui)       ;; 主题 / modeline

;; ── 工具层 ──────────────────────────────────────────────
(require 'init-ivy)      ;; ivy + counsel + swiper
(require 'init-treemacs) ;; 文件树
(require 'init-denote)   ;; 笔记系统
(require 'init-company) ;;补全系统
(require 'init-git) ;; git管理
;;—— 个人信息——
(setq user-full-name "鹏程Frank"
      user-mail-address "fupengcheng95@outlook.com")

;; ── Custom（由 Emacs 自动维护，请勿手动编辑）───────────
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-vertico)
(require 'init-dashboard)

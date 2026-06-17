;;; init-vertico.el --- 补全框架配置 -*- lexical-binding: t; -*-

;;; Commentary:
;; 纵向补全列表套件：vertico + orderless + marginalia + consult
;; 依赖：MELPA 已在 init.el 中配置，use-package 已可用

;;; Code:

;; ── 1. Vertico：纵向补全列表 ─────────────────────────────
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)           ; 列表首尾循环
  (vertico-count 15)          ; 最多显示 15 个候选
  :init
  (vertico-mode))

;; ── 2. Orderless：模糊/乱序匹配 ─────────────────────────
;; 输入 "pff" 可匹配 "project-find-file"，空格分隔多个关键词
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides
   '((file (styles basic partial-completion)))))  ; 文件路径保留前缀匹配

;; ── 3. Marginalia：候选注释 ──────────────────────────────
;; 在补全列表右侧显示命令说明、文件大小、变量值等
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; ── 4. Consult：增强型交互命令 ───────────────────────────
(use-package consult
  :ensure t
  :bind
  (;; buffer 切换（替换内置 C-x b，支持预览）
   ("C-x b"   . consult-buffer)
   ("C-x 4 b" . consult-buffer-other-window)
   ;; 项目内操作（与 project.el 集成）
   ("C-x p b" . consult-project-buffer)
   ("C-x p g" . consult-ripgrep)     ; 需系统安装 ripgrep
   ;; 当前文件搜索
   ("M-s l"   . consult-line)
   ("M-s L"   . consult-line-multi)  ; 跨所有 buffer 搜索
   ;; 粘贴历史
   ("M-y"     . consult-yank-pop))
  :custom
  (consult-preview-key "M-.")        ; 手动触发预览，避免跳动
  (xref-show-xrefs-function #'consult-xref)  ; xref 结果用 consult 显示
  (xref-show-definitions-function #'consult-xref))

;; ── 5. Embark（可选）：对候选执行额外动作 ────────────────
;; 在补全列表中按 C-. 弹出动作菜单（删除文件、复制路径等）
(use-package embark
  :ensure t
  :bind
  (("C-."   . embark-act)
   ("C-;"   . embark-dwim)       ; 对光标处目标执行默认动作
   ("C-h B" . embark-bindings))  ; 替代 describe-bindings
  :custom
  (prefix-help-command #'embark-prefix-help-command))

;; embark 与 consult 联动：在 consult 结果中可用 embark 动作
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'init-vertico)
;;; init-vertico.el ends here

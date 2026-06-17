;; init-encoding.el — 编码与字体

;; ── 编码 ────────────────────────────────────────────────
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; Windows 剪贴板需要 UTF-16-LE
(when (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-16-le))

;; ── 字体 ────────────────────────────────────────────────
;; 英文主字体（非 Windows 通用）
(set-face-attribute 'default nil
                    :family "Consolas"
                    :height 130)

;; 中文 fallback（非 Windows 通用）
(set-fontset-font t 'han     "SimSun")
(set-fontset-font t 'cjk-misc "SimSun")

;; Windows 专项字体覆盖
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :font "Microsoft YaHei" :height 120)
  (set-fontset-font "fontset-default" 'han      "Microsoft YaHei")
  (set-fontset-font "fontset-default" 'cjk-misc "Microsoft YaHei"))

(provide 'init-encoding)

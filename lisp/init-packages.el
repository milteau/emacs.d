;; init-packages.el — 包管理器初始化

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; 首次启动自动刷新包列表
(unless package-archive-contents
  (package-refresh-contents))

(provide 'init-packages)

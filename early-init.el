;; early-init.el — GUI 初始化之前执行，Emacs 27+ 专属

;; 禁用 UI 元素，在窗口绘制前就关掉，避免闪烁和无效渲染
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)

;; 启动期间暂停 GC，加快加载速度
(setq gc-cons-threshold most-positive-fixnum)

;; 启动完成后恢复正常 GC 阈值（8MB）
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 8 1024 1024))))

;; 禁用包管理器提前初始化（交由 init-packages.el 接管）
(setq package-enable-at-startup nil)

;; 将 eln-cache 转移到系统的临时目录或专用的 Cache 目录
(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache
   (expand-file-name "emacs-eln-cache/" temporary-file-directory)))

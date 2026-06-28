# emacs.d

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Emacs](https://img.shields.io/badge/Emacs-28%2B-green.svg)]
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-ff69b4.svg)]

> 为文科生准备的 Emacs 配置。写论文、整理读书笔记、管理碎片化想法——在一个安静的地方，把想法连接起来。

---

## 项目简介

作为文科生，你可能经常遇到这些困扰：

- **写论文时**，文献笔记散落在各个 Word、备忘录、微信收藏里，找起来费时间
- **读书时**，满脑子想法却没法整理，看完就忘
- **写随笔时**，想把日记、文章、草稿分开，但又想方便地互相引用
- 用了各种笔记软件（Notion、Obsidian……），最后笔记越堆越多，变成另一个负担

**这个配置想帮你做的事很简单：在一个安静的地方，用最少的干扰，写下你的想法，把它们连接起来。**

### 设计理念

- **够用就好**：不追求功能强大，只追求专注于写作本身
- **笔记自主**：每篇笔记都是独立的 `.org` 文件，保存在你自己的电脑里，不被任何软件绑定
- **零学习成本**：不需要记住任何快捷键，提示框会告诉你下一步该按什么
- **安静界面**：Modus Operandi 亮色主题、简洁状态栏，长时间写作也不累眼睛

---

## 核心功能

### 1. denote —— 双向链接笔记系统

denote 是这个配置的核心。它是一个极简的笔记管理系统，设计理念是：每篇笔记专注于一个想法，用双向链接把它们串联起来。

**主要命令：**

| 命令 | 快捷键 | 作用 |
|------|--------|------|
| `denote` | `C-c n n` | 新建一篇笔记 |
| `denote-open-or-create` | `C-c n f` | 打开一篇笔记（不存在则创建） |
| `denote-link` | `C-c n i` | 在当前笔记中插入指向另一篇笔记的链接 |
| `denote-backlinks` | `C-c n b` | 查看有哪些笔记链接到了当前这篇 |

### 2. Vertico + Consult —— 现代补全与搜索

Vertico 提供纵向补全列表，Consult 在此基础上提供了更强大的交互命令：

| 快捷键 | 命令 | 作用 |
|--------|------|------|
| `C-x b` | `consult-buffer` | 切换 buffer（支持预览） |
| `M-s l` | `consult-line` | 在当前文件中搜索 |
| `M-s L` | `consult-line-multi` | 跨所有 buffer 搜索 |
| `C-x p g` | `consult-ripgrep` | 项目内全文搜索 |
| `M-y` | `consult-yank-pop` | 粘贴历史 |

按 `C-.` 或 `C-;` 可以对候选目标执行额外动作（embark）。

### 3. Dashboard —— 启动首页

启动 Emacs 后会显示 Dashboard 首页，展示近期文件、书签、项目等信息。

### 4. Treemacs —— 文件树侧边栏

按 `C-x t t` 打开或关闭侧边栏，显示笔记目录结构。

### 4. Magit —— Git 版本控制

按 `C-x g` 打开 Magit 状态界面，管理你的笔记版本历史。

### 5. Org-mode —— 任务管理与写作

- **TODO 任务流**：自定义状态 `TODO → DOING → DONE / CANCELLED`，带颜色高亮
- **快速捕获**：`C-c c` 调出收件箱，记录任务或灵感；`C-c a` 打开日程视图
- **智能链接**：自动识别国内站点（百度、B 站等）用系统浏览器打开，其他链接用 EWW 内置浏览器
- 启动时默认折叠、大纲优化、代码块原生高亮

### 6. Org Publish —— 笔记发布

支持将 `.org` 文件发布为 HTML，可配置个人网站部署路径。

### 7. which-key —— 快捷键提示

当你按下第一个键时，屏幕底部会浮现提示框，显示接下来可以按什么键。**你不需要记住任何快捷键。**

### 8. Modus 主题 —— 护眼界面

默认使用 Modus Operandi 亮色主题，配色柔和、对比度适中，长时间写作也不累眼睛。

---

## 快速开始

### 环境要求

- **Emacs 28** 或更高版本
- **操作系统**：Windows 10/11、macOS、Linux

### 安装步骤

```bash
git clone https://github.com/milteau/emacs.d.git ~/.emacs.d
```

启动 Emacs，第一次会自动下载插件（需要联网）。

### 目录结构

```
.emacs.d/
├── early-init.el           # Emacs 27+ 启动优化
├── init.el                 # 主入口
├── custom.el               # Emacs 自动维护的自定义配置
├── lisp/
│   ├── init-backup.el      # 备份与自动保存配置
│   ├── init-company.el     # 文本补全框架
│   ├── init-core.el        # 编辑器基本行为
│   ├── init-dashboard.el   # 启动首页
│   ├── init-denote.el      # 双向链接笔记系统
│   ├── init-encoding.el    # 编码与字体
│   ├── init-git.el         # Magit Git 界面
│   ├── init-ivy.el         # Ivy 搜索补全
│   ├── init-modeline.el    # 自定义状态栏
│   ├── init-org.el         # Org-mode 配置（TODO、捕获、链接）
│   ├── init-packages.el    # 包管理器
│   ├── init-publish.el     # Org Publish 网站发布
│   ├── init-treemacs.el    # 文件树侧边栏
│   ├── init-ui.el          # 主题配置
│   └── init-vertico.el     # Vertico 纵向补全
└── README.md
```

---

## 快捷键指南

> 提示：`C` 代表 Ctrl 键，`M` 代表 Alt 键。

### 笔记操作

| 快捷键 | 命令 | 作用 |
|--------|------|------|
| `C-c n n` | `denote` | 新建一篇笔记 |
| `C-c n f` | `denote-open-or-create` | 打开笔记（不存在则创建） |
| `C-c n i` | `denote-link` | 插入链接到另一篇笔记 |
| `C-c n b` | `denote-backlinks` | 查看反向链接 |

### 任务与捕获

| 快捷键 | 命令 | 作用 |
|--------|------|------|
| `C-c c` | `org-capture` | 快速捕获任务或灵感 |
| `C-c a` | `org-agenda` | 打开日程视图 |

### 文件浏览

| 快捷键 | 命令 | 作用 |
|--------|------|------|
| `C-x t t` | `treemacs` | 打开或关闭文件树 |
| `C-x t 1` | `treemacs-select-window` | 专注当前窗口 |

### 版本控制

| 快捷键 | 命令 | 作用 |
|--------|------|------|
| `C-x g` | `magit-status` | 打开 Git 状态界面 |

### 搜索

| 快捷键 | 命令 | 作用 |
|--------|------|------|
| `C-s` | `swiper` | 在当前文件中搜索 |
| `M-s l` | `consult-line` | 搜索（带行号跳转） |
| `M-s L` | `consult-line-multi` | 跨所有 buffer 搜索 |

### 通用

| 快捷键 | 作用 |
|--------|------|
| `C-g` | 取消当前操作 |
| `C-x C-s` | 保存当前文件 |
| `C-x C-f` | 打开文件 |
| `M-x` | 输入命令名称来执行命令 |

---

## 常见问题

### Q: 完全没用过 Emacs，要先学什么吗？

**不需要专门学习。** 打开 Emacs，直接开始写就好。你只需要知道几个快捷键，就能完成日常写作任务。

### Q: 什么是 `.org` 文件？

`.org` 是 Emacs 特有的一种纯文本格式，用来写笔记、日程、做计划。它本质上是普通文本文件，但有一些简单的标记语法。denote 默认使用 `.org` 格式保存笔记。

### Q: 我的笔记会不会丢失？

**不会。** 每篇笔记都是一个独立的 `.org` 文件，保存在你自己电脑的 `~/org/denote/` 目录里，不依赖任何云服务或特定软件。

---

## 插件列表

| 插件 | 用途 |
|------|------|
| `denote` | 双向链接笔记管理 |
| `org` | Org-mode 核心（任务管理、写作、导出） |
| `vertico` + `orderless` + `marginalia` | 纵向补全与模糊匹配 |
| `consult` | 增强型交互命令 |
| `embark` + `embark-consult` | 候选目标动作菜单 + Consult 集成 |
| `ivy` + `counsel` + `swiper` | 搜索补全（与 Vertico 同时启用） |
| `company` + `company-box` | 文本补全框架 + 补全弹出菜单美化 |
| `which-key` | 快捷键提示 |
| `treemacs` | 文件树侧边栏 |
| `nerd-icons` | Treemacs / Dashboard 图标支持 |
| `modus-themes` | 主题包（含 Modus Operandi 亮色主题） |
| `doom-modeline` | 状态栏美化 |
| `org-bullets` | Org 标题美化 |
| `dashboard` | 启动首页 |
| `magit` | Git 版本控制界面 |
| `projectile` | 项目管理 |
| `zzz-to-char` | 快速跳转至指定字符 |

---

## 开源协议

本项目基于 [MIT License](LICENSE) 开源。

---

如果你觉得这个配置对你有帮助，欢迎 Star ⭐

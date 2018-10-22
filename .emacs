(setq user-full-name "David Griffiths"
      user-mail-address "d@vid.gr")

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)

(require 'helm-config)

;(add-hook 'foo-mode-hook #'rainbow-delimiters-mode)

(load-theme 'afternoon t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(set-default-font "Inconsolata 18")

(global-display-line-numbers-mode)

;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

;; hide menu and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; (use-package dracula-theme)
;; (use-package atom-one-dark-theme)
(use-package atom-dark-theme)

(use-package evil
  :demand)

(use-package ensime
  :ensure t
  :pin melpa-stable)

;; ensime keybindings
(fset 'send-current-line
   [?\C-a ?\S-\C-e ?\M-x ?e ?n ?s ?i ?m ?e ?- ?i ?n ?f ?- ?e ?v ?a ?l ?- ?r ?e ?g ?i ?o ?n return ?\C-f])

(global-set-key (kbd "C-<return>") 'send-current-line)

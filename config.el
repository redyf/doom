;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq confirm-kill-emacs nil)
(setq inhibit-startup-message t)
(setq debug-on-error t)
(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable the toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room
(menu-bar-mode -1) ; Disable the menu bar

;; If your gpu has vsync on or you’re experiencing flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Set up the visible bell
;; (setq visible-bell t)
(setq ring-bell-function 'ignore)

(column-number-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)  ;; Use relative line numbers
(setq display-line-numbers-width 4)  ;; Set the width of line numbers to 4 digits

;; Set the idle update delay to increase FPS
(setq idle-update-delay 0.01) ;; 100 FPS (0.01 seconds delay between updates)

;; Enable pixel-perfect precision scrolling
(pixel-scroll-precision-mode 1)
(setq pixel-scroll-precision-interpolate-page t    ;; Smooth page scrolling
      pixel-scroll-precision-large-scroll-height 40 ;; Set height for large scrolls
      pixel-scroll-precision-mode t)                ;; Enable for the entire mode

;; Prevent Emacs from pausing during redisplay to improve animation smoothness
(setq redisplay-dont-pause t)

(global-set-key (kbd "C-S-v") 'yank)

(set-face-attribute 'default nil :font "Berkeley Mono" :height 120)

(setq evil-insert-state-cursor 'bar) ;; bar / box / hollow

(map! :n [tab]   #'next-buffer)
(map! :n [backtab] #'previous-buffer)
(map! :n "M-h" #'+vterm/toggle)

(after! which-key
  (setq which-key-idle-delay 0.01   ; Main delay
        which-key-idle-secondary-delay 0.05)) ; Secondary delay

(require 'key-chord)
(use-package! key-chord
  :defer t
  :config
  (key-chord-mode 1)
  (setq key-chord-one-key-delay 0.2)
  (setq key-chord-two-keys-delay 0.2)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(require 'elcord)
(elcord-mode)

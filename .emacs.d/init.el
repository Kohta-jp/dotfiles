;;
;;
;;

;;
;; Load-paths
;; 

(defun add-to-load-path(&rest paths)	;new commad add-to-load-path
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name(concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; auto add paths
(add-to-load-path "elisp""conf")


;;
;; KeyBind
;; 

(load "origami-keybinding")

;;
;; Modeline settings
;; 

(load "origami-modeline")


;;
;; Titlebar settings
;; 

(load "origami-titlebar")

;;
;; Font settings
;;

(set-face-attribute 'default nil
		    :family "HackGen35Nerd"
		    :height 120)

;;
;; Package settings
;;

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("celpa" . "https://celpa.conao3.com/packages/") t)
(package-initialize)


(load "package-settings")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(indent-guide company-jedi company-irony company flycheck embark-consult embark marginalia consult orderless vertico neotree all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

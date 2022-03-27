


;; neotree
(require 'neotree)
(setq neo-smart-open t)
(global-set-key [f8] 'neotree-toggle)
(define-key neotree-mode-map "a" 'neotree-hidden-file-toggle)
(define-key neotree-mode-map "r" 'neotree-refresh)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(add-hook 'neo-enter-hook
          (lambda (type & rest)
           (if (equal type 'file)
               (neotree-hide))))

;; all-the-icons
(when (display-graphic-p)
  (require 'all-the-icons))	 

;;
;; auto completion
;; 

;; 補完スタイルにorderlessを利用する
(require 'orderless)
(setq completion-styles '(orderless))

;; 補完候補を最大20行まで表示する
(setq vertico-count 20)

;; vertico-modeとmarginalia-modeを有効化する
(defun after-init-hook ()
  (vertico-mode)
  (marginalia-mode)
  ;; savehist-modeを使ってVerticoの順番を永続化する
  (savehist-mode))
(add-hook 'after-init-hook #'after-init-hook)

;; embark-consultを読み込む
(with-eval-after-load 'consult
  (with-eval-after-load 'embark
    (require 'embark-consult)))




;; ()"" auto clompletion
(electric-pair-mode 1)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Company
(require 'company)
(global-company-mode) 
(setq company-transformers '(company-sort-by-backend-importance)) 
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 4)
(setq company-selection-wrap-around t)
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "TAB") 'company-complete-common-or-cycle)
(push 'company-preview-common-frontend company-frontends)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next) 
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
(define-key company-active-map [tab] 'company-complete-selection)
(define-key company-active-map (kbd "C-f") 'company-complete-selection)
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)


;; company-c/c++
(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-to-list 'company-backends 'company-irony)

;; company-jedi
(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-to-list 'company-backends 'company-jedi)


;; indent-guide
(require 'indent-guide)



;;; package-settings.el ends here

